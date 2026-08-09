# dotfiles（chezmoi source）

`~/.claude` を含む dotfiles の source。**実体を編集して `chezmoi add` すると
共有の source に書くので、agent は `chezmoi add -S <worktree>` を使う。**

## `~/.claude` は allowlist 方式で管理されている

`.chezmoiignore.tmpl` はまず `.claude/**` を無視し、そのあと `!` 行で個別に戻している。

**つまり `dot_claude/` に新しく置いたファイルは、`!` 行を足すまで黙って管理外になる。**
意図は「設定だけ管理し、実行時の状態と秘密は無視する」こと。

**忘れたときの症状**: source ツリーに存在するのに
`chezmoi managed` / `status` / `diff` / `cat` が「管理外」と言う。

**手順**: `dot_claude/` にファイルを足したら `.chezmoiignore.tmpl` に対応する `!` 行を
足す（例: `!.claude/rules` と `!.claude/rules/**` の2行）。
`chezmoi apply` の前に `chezmoi status | grep claude` で確認する。

## hook の正規表現を触る前に

**`scripts/test-claude-hooks.sh` を走らせる。113ケースある。**

2026-07-31 に正規表現を3回書き直し、**書き直すたびに前の版の穴が1つ露出した。**
目視で通ったと判断しないこと。

## 権限と hook の監査

`docs/plan/claude-permission-holes-20260731.md` に記録がある（PR #3556、2026-07-31 マージ）。
**2026-07-31 時点で全項目クローズ済み。** 再導出せずそちらを読む。

そこに一目では書いていない挙動は `~/.claude/rules/general.md` の 🤖 節にまとめてある。
