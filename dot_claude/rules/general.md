# 共通ルール（言語非依存）

全プロジェクトに適用される。言語固有のチェックは兄弟ファイル `rules/<lang>.md` にあり、
該当するファイルを触ったときにだけ読み込まれる。

## 🚫 絶対禁止（NEVER）

- main/master へ直接 push しない。feature ブランチを使う
- API キー、パスワード、シークレットをハードコードしない
- テストや lint が通らないコードをコミットしない
- 明示的な確認なしに本番データを削除しない
- 認証・認可のコードでレビューを飛ばさない

## ✅ 必須（YOU MUST）

- 新機能とバグ修正にはテストを書く
- タスクを完了とする前に品質チェックを実行する
- 破壊的変更と公開 API を文書化する
- 改善を能動的に提案する（設計パターン、性能、抜けているエラー処理）

## 🕐 現在時刻

- **現在時刻を推測・概算しない。** `date` を実行し、その出力を使う。
  経過時間の推測は静かにずれていき、本人はその数字を信じて動く。
  「あと10分」が間違っていれば、家を出る時刻が変わる。
- 重要になるたびに `date` を実行し直す。セッション1回につき1度ではない。
  セッションは数時間にわたる。

## 🖨 紙に印刷する資料

**pandoc で変換しない。** 既定では明朝になり、A4 何枚になるかも分からない。

- **テンプレート:** `~/ghq/github.com/mimikun/mimikun.agent-system/print/_TEMPLATE.html`
  をコピーして本文を差し替える。ゴシック体・`@page` で A4・モノクロが入っている。
  使い方と検証コマンドはファイル先頭のコメントにある
- **必ずページ数を実測する。** headless Chrome で PDF 化し、`/Type /Page` を数える。
  「1枚に収まる」は目視の推測では確定しない
- **出来上がった PDF を画像として見る。** 見ないと崩れに気づけない

## 🌐 言語ポリシー（コード）

- **コード、コメント、docstring、コミットメッセージ:** 英語
- **ルール・指示文書の散文（`rules/**`、`CLAUDE.md`、`handover.md` など）:** 日本語
- **README / ファイルの本文:** プロジェクトの方針に従う

## 🌳 Git とコミット

- **ワークフロー:** Explore → Plan → Code → Commit。feature ブランチを使う。
  並行作業には worktree を使う（`git worktree add ../project-<type>-<desc> <branch>`）。
- **前提: 本人は基本 rebase merge を使う。** マージのたびに master 上の SHA が
  変わる。squash も同じ。merge commit だけが SHA を保つ。下2つはこの前提から出ている。
- **新しいブランチは master を最新にしてから切る。分岐元を省略しない:**
  `git switch master; and git pull --ff-only; and git switch -c <name>`。
  `git switch -c <name>` だけ実行すると**直前のブランチから枝分かれする**。
  未マージのブランチの上に積むと、そのブランチがマージされた時点で SHA が変わり、
  同じパッチを古い SHA で抱えたままになる。
- **PR がマージ可能かを GitHub の `mergeable` で判断しない。**
  `git cherry origin/master <branch>` を使い、**`-` が付いたコミットが無いこと**を見る。
  `-` は「同等パッチが master に既にある」の意味で、rebase すると空コミットになり
  GitHub が rebase merge を拒否する。**このとき GitHub は
  `mergeable: MERGEABLE` / `mergeStateStatus: CLEAN` と表示するので当てにならない**
  （2026-08-01 に発生。force push は禁止なので PR を出し直して対処した）。
- **コミット:** Conventional Commits — `feat(scope): subject`、`fix`、`docs`、
  `perf`、`refactor`。
- **PR:** 問題と解決策に焦点を当てる。co-authored-by やツールへの言及は入れない。

## 🤖 Claude Code 自身の設定

- 実際に読まれる設定は `~/.claude/settings.json` で、chezmoi 管理下にある
  （`dot_claude/private_settings.json`）。ファイルを直接編集すると drift が発生する。
  編集後に `chezmoi add` を実行するか、`chezmoi edit` を使うこと。
  **git リポジトリかどうかでバックアップの有無を判断しないこと。**
- `~/ghq/github.com/mimikun/mimikun.claude-code-config/` は放棄済み。読まない、編集しない。
- **設定キーと環境変数は、勧める前に必ずバイナリに対して検証する:**
  `grep -c '<name>' (readlink -f (which claude))`。settings.json の `env` ブロックは
  自由記述のパススルーなので、Claude Code は自分が読まない名前について警告できず、
  間違った名前は永久に静かに無効のままになる。実際に起きた —
  `CLAUDE_CODE_HIDE_ACCOUNT_INFO` が数ヶ月間設定されていたが、そんなものは存在しなかった
  （`mimikun.agent-system` に P07 として記録済み。実際に効くフラグは `IS_DEMO`）。
- `~/.claude/hooks/check-settings-env.sh` がセッション開始時に同じチェックを再実行するが、
  見ているのは settings.json だけ。会話の中で設定名を挙げる場合は対象外なので、先に grep すること。
- **権限ルール: ファイルパス指定のルールは `Edit(path)` と `Read(path)` でしか効かない。**
  `Write(path)`、`MultiEdit(path)`、`NotebookEdit(path)`、`Glob(path)` は一切参照されない。
  `Edit` がファイル編集系ツールすべてを、`Read` がファイル読み取り系ツールすべてをカバーする。
  「対称性のため」にツール別の変種を足すと、起動時警告が26件出て保護は増えない。
  2026-07-31 に実際にやって差し戻した
  （`docs/plan/claude-permission-holes-20260731.md` §第5弾 を参照）。
  ファイルルールの中に `:*` を書くのは回避策ではなく明確なバリデーションエラー。
  `:*` の前方一致は `Bash(...)` にしか存在しない。
- **Plan Mode: `ExitPlanMode` を呼ぶ前に `plan-preview` skill を走らせ、
  計画本文に `Plan preview: <url>` の行を入れる。**
  強制しているのは `reviewable-html-workbench` plugin 同梱の
  `PreToolUse(ExitPlanMode)` hook であって、このルールではない。hook は
  `Plan preview: <url>` か `Plan preview: unavailable (<理由>)` の行が無ければ deny する。
  つまり先に走らせなければ deny → 生成 → 再試行で毎回1往復無駄になる。それだけの話。
  `unavailable` は preview 生成が実際に失敗したときのためのもので、省略の手段ではない。
