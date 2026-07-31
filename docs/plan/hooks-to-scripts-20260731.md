# インライン hook を bash スクリプトへ切り出す計画 (2026-07-31)

`dot_claude/private_settings.json` に JSON 文字列として直接埋まっている hook を、
`dot_claude/hooks/` 配下の bash スクリプトへ移す。settings.json 側はスクリプトを
呼ぶだけにする。

方針の出典は `claude-permission-holes-20260731.md` の末尾「将来の方針」。
外部ツール (cchook 等) は採用しない。

## 着手前の棚卸し (2026-07-31 実測)

hook は全10本。**切り出す対象は5本**で、残り5本は既に外部コマンドか
スクリプト呼び出しなので手を入れない。

| 種別 | 本数 | 中身 | 対象 |
|---|---|---|---|
| インライン shell (Bash ガード) | 4 | `destructive push` / `recursive rm` / `destructive git` / `interpreter one-liners`。356〜739文字 | ✅ |
| インライン shell (Todoist) | 1 | matcher は `mcp__claude_ai_Todoist__(add\|update\|...)-`。440文字 | ✅ |
| 外部コマンド | 3 | `git-ai checkpoint` ×2、`rtk hook claude` | — |
| 既存スクリプト呼び出し | 2 | SessionStart の `check-settings-env.sh` / `herdr-agent-state.sh` | — |

`claude-permission-holes-20260731.md` は「hook 4本」と書いているが、
インラインは実際には5本ある。

### 中身を読んで分かったこと

- **Todoist hook はガードではない。** 正規表現も deny も無く、静的な
  `additionalContext` を `echo` しているだけ (Todoist 同期ルールの注入)。
  113ケースのテストが当たっていないのは穴ではなく、**判定する分岐が無い**から。
  スクリプト化の利点は安全性ではなく、JSON の中の JSON という二重エスケープが
  解けて文章として読めるようになること
- **Bash ガード4本は同一の形**: `jq -r '.tool_input.command'` → `grep -Eq <正規表現>`
  → deny JSON を `printf` → 末尾 `|| true`。one-liners だけ grep 2段
  (インタプリタ判定 + 危険API判定)
- **`.chezmoiignore.tmpl` は対応不要。** 既に `!.claude/hooks/**` がある

## ⚠️ 最大の事故ポイント: `set -euo pipefail` と終了コード

`grep -Eq` が**マッチしない**ことは正常系であり、終了コードは1になる。現行の
インライン版は末尾 `|| true` でこれを0に潰している。hook は非ゼロ終了だと
Claude Code 側の扱いが変わるため、**`set -euo pipefail` を付けたスクリプトへ
機械的に移すと、マッチしなかった全ケースで hook が異常終了する。**

各スクリプトは次を明示的に満たすこと:

- マッチした → deny JSON を stdout に出して **exit 0**
- マッチしない → 何も出さず **exit 0**

## 決定事項

| # | 論点 | 決定 |
|---|---|---|
| D1 | 切り出す範囲 | インライン5本すべて。JSON にインライン shell を一行も残さない |
| D2 | スクリプトの粒度 | 1 hook = 1スクリプト。**共通 lib は作らない** — hook が壊れると全作業が止まるので、共通失敗点を作らず独立性を優先する |
| D3 | テストランナー | スクリプトを直接呼ぶ。**加えて settings.json からの参照検査を追加する** |
| D4 | 進め方 | 1本ずつ切り出し、都度113ケースを実行して1ステップ1コミット |

### D3 の参照検査を入れる理由

case ファイルが指すスクリプトが `hooks.PreToolUse` から実際に参照されているかを
検査する。これが無いと、パスを typo した状態で**スクリプト単体テストは全緑なのに
本番の hook は一本も動いていない**という状態を見逃す。

同日の permission 監査で「設定同士の整合性は発火の証拠にならない」を一度踏んで
いる。同じ形の罠を先に塞ぐ。

### 移行中もテストを緑に保つ仕掛け

D4 (1本ずつ) と D3 (スクリプト直接実行) を両立させるため、ランナーに**一時的な
二重解決**を入れる。case ファイルの `# hook:` が指すスクリプトが存在すれば
それを実行し、無ければ従来どおり `statusMessage` で settings.json から引く。

これで「移行済み1本 + 未移行3本」の途中状態でも全ケースが走る。手順7で
fallback を削除する。

## 手順 (1コミット = 1ステップ)

ベースライン: 着手前に113ケース全緑を確認済み。

| # | 内容 | 検証 |
|---|---|---|
| 1 | ランナーに二重解決 + 参照検査を追加 | 113緑 (まだ何も移行していない) |
| 2 | `deny-recursive-rm.sh` を切り出し | 31ケースがスクリプト経由で緑 |
| 3 | `deny-destructive-push.sh` | 30ケース |
| 4 | `deny-destructive-git.sh` | 24ケース |
| 5 | `deny-interpreter-oneliners.sh` | 28ケース。**grep 2段で最難関** |
| 6 | `todoist-sync-reminder.sh` | ケース無し。手で叩いて JSON 妥当性を確認 |
| 7 | ランナーから fallback を削除 | 113緑、全件スクリプト経由 |
| 8 | 実機確認 (再起動して各ガードを踏む) | — |

配置は既存に倣い `dot_claude/hooks/executable_<name>.sh`
(実体は `~/.claude/hooks/<name>.sh`)。

### 手順8で踏む材料

2026-07-31 のセッション中に `rm -rf node_modules` と `git push --delete` が
どちらもブロックされた。つまり recursive-rm と destructive-push は移行前の
時点で確実に生きている。移行後に同じ2つを踏み直せば、この2本は挙動が
変わっていないと言い切れる。

## やらないこと

- 正規表現そのものの変更。**移行と挙動変更を同じコミットに混ぜない。**
  正規表現は3回書き直して3回とも穴が見つかっている
- `scripts/test-claude-hooks.sh` の削除・縮小
- 外部コマンド3本と SessionStart スクリプト2本への変更
