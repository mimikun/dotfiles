# starship プロンプトに git worktree インジケータを追加する

作成日: 2026-07-22
対象ファイル: `dot_config/starship/starship.toml`（適用先 `~/.config/starship/starship.toml`）

## 背景 / なぜこれをやるか

nvim 設定リポジトリ（`~/.config/nvim`）で git worktree 運用を始めた。
`scripts/nvim-worktree.sh`（skill: `/nvim-worktree`）で
`~/.config/nvim-<name>` にワークツリーを生やし、direnv + `NVIM_APPNAME` で
`cd` するだけ別コンテキストに切り替わる構成。

このとき **「メインツリーで `git switch` したら別ワークツリーのブランチまで
変わってしまった」** ように見える事故が起きた。実機で再現検証した結論:

- git worktree は **HEAD がツリーごとに完全独立**。片方で `switch` しても
  他方の HEAD は絶対に動かない。
- git は **同一ブランチの二重 checkout を物理的に禁止**している
  （`fatal: '<branch>' is already used by worktree at ...`）。
  よって「2ツリーが同じブランチに並ぶ」状態はそもそも作れない。
- 実際に起きていたのは **「メインのつもりで叩いた端末が、実は
  `~/.config/nvim-<name>` に `cd` した状態だった」** という取り違え。
  `cd` だけでコンテキストが変わる構成 + 複数タブで cwd を勘違いしていた。

現在のプロンプトは worktree がまだ一般的でなかった時代に作ったもので、
**「今どの物理ワークツリーにいるか」を示す視覚的手掛かりが無い**。
これが取り違えの温床なので、プロンプトにインジケータを足して恒久対策する。

## ゴール

- リンクされた git worktree（メイン作業ツリー以外）にいるときだけ、
  プロンプトにワークツリー名を表示する。
- メイン作業ツリーでは何も出さない（従来どおり）。
- 特定プロジェクトに依存しない汎用の仕組みにする（nvim 設定に限らず
  どのリポジトリの worktree でも効く）。

## 変更内容（推奨案: custom モジュール）

`starship.toml` は `format = "$all"` なので、`[custom.*]` を足すだけで
自動的にプロンプトに出る（`$all` に `$custom` が含まれる）。以下を追記する。

```toml
[custom.git_worktree]
description = "リンクされた git worktree にいるときだけワークツリー名を表示"
# メインツリーの git-dir は ".git"、リンク先は ".../.git/worktrees/<name>"。
# "/worktrees/" を含むかで判定（git 呼び出し1回に抑える）。
when = 'git rev-parse --git-dir 2>/dev/null | grep -q "/worktrees/"'
command = 'basename "$(git rev-parse --show-toplevel)"'
format = "[$symbol$output]($style) "
symbol = "⑂ "
style = "bold fg:214"
shell = ["bash", "--noprofile", "--norc"]
disabled = false
```

### 判定ロジックの検証結果（2026-07-22 実機確認）

| 場所 | `git rev-parse --git-dir` | 判定 | 表示 |
|---|---|---|---|
| `~/.config/nvim`（メイン） | `.git` | MAIN | 非表示 |
| `~/.config/nvim-tmp-probe`（リンク先） | `.../.git/worktrees/nvim-tmp-probe` | LINKED | `⑂ nvim-tmp-probe` |

### 表示位置について

`$all` 内での custom モジュールの位置は固定順。`git_branch` の真横に
出したい場合は、`format` を明示的に組んで `$git_branch$custom` のように
並べる必要がある（`$all` をやめて全モジュールを列挙するか、
`$all` を使いつつ末尾に足すかは好みで）。まずは既定位置で十分。

## 代替案 / 併用案: env_var モジュール（nvim 設定 worktree 特化・軽量）

nvim-worktree の各ワークツリーには direnv の `.envrc`
（`export NVIM_APPNAME=nvim-<name>`）があり、`cd` すると shell 環境に
`NVIM_APPNAME` が入る。これを直接表示する方式。**サブプロセスを起こさない
ぶん軽い**が、`NVIM_APPNAME` を export している nvim 設定 worktree でしか
出ない（汎用性は custom 案に劣る）。

```toml
[env_var.NVIM_APPNAME]
variable = "NVIM_APPNAME"
format = "[$symbol$env_value]($style) "
symbol = "⚙ "
style = "bold fg:orange"
```

推奨は **custom 案（汎用）**。軽さ重視や nvim 専用でよいなら env_var 案、
両方入れて役割を分けても良い（custom=物理ツリー名 / env_var=NVIM_APPNAME）。

## 適用手順（chezmoi）

```bash
# 1. ソースを編集
chezmoi edit ~/.config/starship/starship.toml
#   （= dot_config/starship/starship.toml を編集）

# 2. 反映
chezmoi apply ~/.config/starship/starship.toml

# 3. chezmoi リポジトリでコミット
cd ~/.local/share/chezmoi
git add dot_config/starship/starship.toml docs/plan/starship-worktree-indicator-20260722.md
git commit -m "feat(starship): add git worktree indicator to prompt"
```

## 検証手順

1. 新しいプロンプトを出す（または `exec fish`）。
2. `~/.config/nvim`（メイン）でプロンプトに worktree インジケータが
   **出ない**ことを確認。
3. `/nvim-worktree add <branch>` で worktree を作り
   `cd ~/.config/nvim-<name>` → `⑂ nvim-<name>`（custom 案）や
   `⚙ nvim-<name>`（env_var 案）が **出る**ことを確認。
4. 別タブでメインに戻り、両者でインジケータ表示が食い違う
   ＝取り違え防止になっていることを確認。
5. 後片付け: `/nvim-worktree remove <name>`。

## 注意 / 既知の制約

- **パフォーマンス**: custom 案はプロンプト毎に `git rev-parse` を最大2回
  呼ぶ（`when` 1回 + `command` 1回）。git repo 外では `when` が即失敗して
  非表示になるだけ。`command_timeout = 500` の範囲で問題なし。
- **クロスプラットフォーム**: `starship.toml` は `.tmpl` ではなく全マシン
  共有。custom 案は `bash` / `basename` 前提なので Windows ネイティブでは
  モジュールが黙って非表示になる想定（実害なし）。worktree 運用は WSL/Linux
  中心なのでこれで足りる。厳密にやるなら chezmoi テンプレート化して OS で
  出し分ける手もある。
- **判定の取りこぼし**: パス自体に `/worktrees/` を含む異常なリポジトリでは
  誤判定し得るが実用上ほぼ無視できる。厳密にするなら
  `test "$(git rev-parse --git-dir)" != "$(git rev-parse --git-common-dir)"`
  に置き換える（git 呼び出しは2回に増える）。

## 参考

- 事故の再現・検証は nvim 設定リポジトリ側の作業で実施済み
  （`scripts/nvim-worktree.sh`, skill `/nvim-worktree`）。
- git worktree の要点: 「ブランチ集合は全ツリー共有 / 作業ツリー(HEAD)は各自
  独立 / 同一ブランチの二重 checkout は禁止」。唯一の真実は
  `git worktree list`。プロンプト表示は cwd 依存なので過信しない。
