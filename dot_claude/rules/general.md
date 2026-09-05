# 共通ルール（言語非依存）

全プロジェクトに適用される。言語固有のチェックは兄弟ファイル `rules/<lang>.md` にあり、
該当するファイルを触ったときにだけ読み込まれる。

## 🚫 絶対禁止（NEVER）

- main/master へ直接 push しない。feature ブランチを使う
- **force push しない。** 履歴を書き換える操作は本人が手で行う
- API キー、パスワード、シークレットをハードコードしない
- テストや lint が通らないコードをコミットしない
- 明示的な確認なしに本番データを削除しない
- 認証・認可のコードでレビューを飛ばさない
- **外部へ送る / 公開する前に確認する**（メッセージ送信、PR やコメントの投稿、
  外部サービスへのアップロード）。**消しても取り消せない**

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

## 🌐 言語ポリシー

- **チャットでの応答:** 常に日本語
- **ルール・指示文書の散文（`rules/**`、`CLAUDE.md`、`handover.md` など）、
  および記録の散文:** 日本語（2026-08-01 に英語から変更）
- **コード、コメント、docstring、コミットメッセージ、設定ファイルの値:** 英語。
  上の日本語ルールをここまで広げないこと
- **PR のタイトル:** 英語。**squash merge ではそのままコミット subject になる**ので、
  コミットメッセージと同じ側にある。**本文（description）は日本語でよい** —
  読むのは本人であり、上の「散文は日本語」に従う
- **README / ファイルの本文:** プロジェクトの方針に従う

## 🌳 Git とコミット

- **ワークフロー:** Explore → Plan → Code → Commit。feature ブランチを使う。
  作業場所は下の「エージェントは worktree で作業する」に従う。
- **前提: 本人は基本 rebase merge を使う。** マージのたびに master 上の SHA が
  変わる。squash も同じ。merge commit だけが SHA を保つ。下2つはこの前提から出ている。
- **新しいブランチは master を最新にしてから切る。分岐元を省略しない:**
  `git switch master; and git pull --ff-only; and git switch -c <name>`。
  `git switch -c <name>` だけ実行すると**直前のブランチから枝分かれする**。
  未マージのブランチの上に積むと、そのブランチがマージされた時点で SHA が変わり、
  同じパッチを古い SHA で抱えたままになる。
- **マージするのは本人。GitHub の WebUI から手で行う。**
  **AI は `gh pr merge` を実行しない。** PR を出したら、そこで手を止める。
  マージは master を動かす公開操作であり、下2つの確認（`git cherry` を見る、
  マージ後に数える）はその判断材料として本人に渡すもの。
  **勝手にマージすると、渡す相手がいなくなる**
  （2026-08-26 に明文化。それまで規則側に無く、記録の中にしか無かった）。
- **PR がマージ可能かを GitHub の `mergeable` で判断しない。**
  `git cherry origin/master <branch>` を使い、**`-` が付いたコミットが無いこと**を見る。
  `-` は「同等パッチが master に既にある」の意味で、rebase すると空コミットになり
  GitHub が rebase merge を拒否する。**このとき GitHub は
  `mergeable: MERGEABLE` / `mergeStateStatus: CLEAN` と表示するので当てにならない**
  （2026-08-01 に発生。force push は禁止なので PR を出し直して対処した）。
- **マージ後、コミットが全部 master に載ったか数える。**
  `git log origin/master --oneline` で自分のコミットを確認する。
  **GitHub は、同等のパッチが別経路で master に載ると PR を「マージ済み」として
  自動クローズすることがあり、残りのコミットは黙って取り残される。**
  上の rebase 拒否と違い**エラーが出ないので、数えない限り気づけない**
  （2026-08-03 に発生。PR に積んだ2件のうち1件が消え、切り直して出し直した）。
- **コミット:** Conventional Commits — `feat(scope): subject`、`fix`、`docs`、
  `perf`、`refactor`。
- **1変更 = 1コミット寄りで、論理単位に分割する。** 性質の違う変更
  （バグ修正 / リファクタ / 新機能）を1つに混ぜない。
  まとめると後から分割し直す作業が発生する — 実際に発生している。
  複数の論理単位にまたがったら、**コミット前に分割案を出す**。
- **PR:** 問題と解決策に焦点を当てる。co-authored-by やツールへの言及は入れない。
- **PR のタイトルを手で打たない。コミットの subject から機械的に取る:**
  `gh pr create --title (git log -1 --format=%s) ...`。
  **打ち直すと prefix が落ちる。** 2026-09-05 に、コミットは
  `feat(packages): ...` と正しく書きながら、`--title` に別の文字列を打ち直して
  Conventional Commits でない PR を2本出した。commitlint はコミットしか見ないので
  **どのリポジトリでも検出されない。**「気をつける」では2回とも防げていない。
  複数コミットの PR で subject が代表になっていないときだけ、手で書いてよい。

### エージェントは worktree で作業する（2026-08-03 に決定）

**リポジトリに書き込むときは、必ず新規 worktree を切る。既存の作業ディレクトリは
本人専用。** 判定は不要 — 全リポジトリ、常に。

```
git worktree add ../<repo>-<desc> <branch>   # 作業 → commit → push
git worktree remove ../<repo>-<desc>         # 終わったら必ず消す
git branch -d <branch>                       # PR を出したら手元には残さない
```

**push して PR を出した時点で、worktree もローカルブランチも不要。両方消す。**
ブランチはリモートに残っており PR がそれを指しているので、手元の複製は**次に同じ
ブランチ名で worktree を切ろうとしたときに邪魔になるだけ**。マージはユーザーが
WebUI で行うので、手元のブランチがマージ後に自動で消えることもない。

- **`git branch -d` が拒否したら、消さずに止まる。** `-d` は upstream と同一かを見るので、
  拒否は「push し損ねたコミットがある」の意味。**`-D` で潰さない** — 先に何が残って
  いるかを見ること
- **リモートブランチは消さない。** PR がそれを参照している

**`<branch>` が他の worktree でチェックアウト済みだと `worktree add` は失敗する。**
master はほぼ常にこれに当たるので、master で作業するときは次の形にする。

```
git worktree add --detach ../<repo>-<desc> master
git push origin HEAD:master
```

- **detached HEAD から新しいブランチを作るときは ref を完全修飾する:**
  `git push origin HEAD:refs/heads/<name>`。`HEAD:<name>` の短い形は
  **既存ブランチにしか当たらず**、新規だと
  `You must fully qualify the ref.` で落ちる。すぐ上の `HEAD:master` が
  通るのは master が既にあるからで、**例外のほうが既定に見えている**
  （2026-08-07 に踏んだ）。
- **chezmoi は `-S` で worktree を指す:** `chezmoi add -S <worktree> <対象ファイル>`。
  実体ファイルを編集して `chezmoi add` すると、**共有の source ディレクトリに書く**ので
  worktree の意味が消える
- **例外は1つだけ: ビルド成果物や依存を持つリポジトリ**（`node_modules`、`venv` など）。
  worktree ごとに再構築が要るので、本人に確認してから決める
- **理由:** 2026-08-03、別セッションが同じリポジトリでブランチを切り替えている最中に
  `chezmoi add` が相手の作業ツリーへ紛れ込んだ。**共有資源を無くせば原理的に起きない。**
  「書き込む前に確認する」型の対策では、同時書き込み自体は残る

### リモートの使い分け（2026-08-03 に定義）

**主かミラーかは `origin` が指す先で決まる。** リモート名の並び順や登録数では決めない。

- **既定は GitHub が主、Codeberg はミラー。push は GitHub だけでよい。**
  Codeberg へは本人が手で push する（Codeberg 側のミラー機能が使えないため）。
  **AI は Codeberg へ push しない。** PR も GitHub に出す
- **例外: `origin` が Codeberg を指すリポジトリだけは Codeberg が主。**
  そのリポジトリでは PR も Codeberg（`berg` CLI）に出す
- **迷ったら `git remote get-url origin` を見る。** これが唯一の判定材料
- **ミラー側が遅れていても勝手に追いつかせない。** 本人が手で push する運用なので、
  差があるのは異常ではない

## 🤖 Claude Code 自身の設定

- 実際に読まれる設定は `~/.claude/settings.json` で、chezmoi 管理下にある
  （`dot_claude/private_settings.json`）。ファイルを直接編集すると drift が発生する。
  編集後に `chezmoi add` を実行するか、`chezmoi edit` を使うこと。
  **git リポジトリかどうかでバックアップの有無を判断しないこと。**
- **`~/.claude/` のソースリポジトリ `mimikun/dotfiles` は公開。**
  ここに挙げたファイルを編集すると外から読める。**何を書いてよいかは
  `CLAUDE.md` の「🧠 memory の置き場所」にある。**
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
  - **先頭の `!` は無視される**（実測）。`Edit(!...)` の除外は一度も効いていなかった。
    除外したいものは `permissions.ask` に置く。**`ask` は `allow` に勝つ**
    （`allow` の `Edit(./**)` にも一致するパスで、実際に確認が出た）
  - **`**` はドット始まりのセグメントに当たらない。** `Edit(./**)` は `.git/` を
    一度もカバーしていなかった。ルールを試すときは、**他のルールに当たらない
    ドット無しのパス**（`node_modules/` など）を使う
  - **権限の挙動を試せるのは `manual mode` だけ**（shift+tab で切替。
    UI 上の `manual` が内部の `default`）
- **Plan Mode: `ExitPlanMode` を呼ぶ前に `plan-preview` skill を走らせ、
  計画本文に `Plan preview: <url>` の行を入れる。**
  強制しているのは `reviewable-html-workbench` plugin 同梱の
  `PreToolUse(ExitPlanMode)` hook であって、このルールではない。hook は
  `Plan preview: <url>` か `Plan preview: unavailable (<理由>)` の行が無ければ deny する。
  つまり先に走らせなければ deny → 生成 → 再試行で毎回1往復無駄になる。それだけの話。
  `unavailable` は preview 生成が実際に失敗したときのためのもので、省略の手段ではない。
