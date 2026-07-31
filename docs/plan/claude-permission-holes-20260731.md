# Claude Code permissions の残存穴リスト (2026-07-31)

`~/.claude/settings.json`(実体は `dot_claude/private_settings.json`) の
`permissions` と `hooks` を全件監査した結果。**未対応の穴だけ**をここに残す。

対応済みの内容は末尾「今回塞いだもの」を参照。

- 監査対象: deny 55件 → 66件 (Bash 31 / Edit 19 / Write 16)
- Claude Code version: 2.1.220
- 関連: [claude-invalid-confs.md](claude-invalid-confs.md) — 今回の穴の一部はここが発生源

凡例:

- 🔬 実際にコマンドを流して確認済み
- 📖 設定ファイル / バイナリ文字列からの推定（未実測）

---

## 高 — 今回塞いだはずの防御を直接迂回できる

### H1. `git push origin +branch:branch` (refspec の `+`) 🔬

```console
$ git push --dry-run origin +refactor/claude:refactor/claude
To github.com:mimikun/dotfiles.git
 * [new branch]  refactor/claude -> refactor/claude
ok refactor/claude
```

`+` 付き refspec は `--force` と同じ効果を持つが、コマンド文字列に `--force`
も `-f` も現れないため deny (前方一致) も PreToolUse hook (正規表現) も素通りする。
今回の force push 対策の目的そのものを迂回できる。

同系統で未確認 📖: `git push --mirror`。

**塞ぎ方**: hook の正規表現に refspec パターンを追加する。
`git push` の引数に `[[:space:]]\+[^[:space:]]` が現れたら deny。

### H2. `rm -Rf` (大文字 R) 🔬

```console
$ rm -Rf /tmp/claude-probe-nonexistent-xyz2
(通った)
```

`deny: Bash(rm -rf:*)` / `Bash(rm -fr:*)` は前方一致なので、文字列が
1文字でも違うと当たらない。

同系統で未確認 📖: `rm -r -f` / `rm -f -r` / `rm --recursive --force` /
`rm -d -r -f`。

**塞ぎ方**: 前方一致の列挙では追いつかない。force push と同じく
PreToolUse hook で `rm` の引数を正規表現判定するのが確実。

### H3. `git push origin --delete foo` 📖

`deny: Bash(git push --delete:*)` は前方一致のみ。`--delete` が `origin` の
後ろに来る形は当たらない。hook も force 系しか見ていない。

---

## 中 — 別の道具で同じ結果に到達できる

### M1. インタプリタ経由の任意操作 📖

allow に以下がある:

```
Bash(python:*) Bash(python3:*) Bash(node:*) Bash(deno:*) Bash(bun:*)
```

`python -c "import shutil; shutil.rmtree('/path')"` は rm の deny を一切
通らずに同じ結果になる。

緩衝材はある。claude バイナリ内に以下の文言があり、deny ルールを読んで
「別ツールでの迂回」をモデルが判定する仕組みが存在する:

> Block the action if it accomplishes the same effect via a different tool
> — e.g. using Bash with `python -c`, `sed -i`, `cat >`, heredocs, or similar
> to write or edit a file that an Edit/Write/MultiEdit deny rule covers, or
> otherwise routing around a deny rule by switching tools.
> **The named tool itself is enforced separately**

ただしこれはソフト判定であり、ハード禁止ではない。

### M2. `httpie` / `http` が allow に残っている 📖

curl / wget は deny 済みだが `http GET ...` で同じことができる。
意図的なら問題なし。

### M3. sudo の名指しが11個だけ 📖

deny にあるのは `sudo rm` `sudo dd` `sudo mkfs` `sudo fdisk` `sudo mount`
`sudo umount` `sudo passwd` `sudo chmod 777` `sudo chown` `sudo -i` `sudo su`
のみ。以下は該当しない:

- `sudo bash -c '...'`
- `sudo tee /etc/passwd`
- `sudo vim /etc/sudoers`

### M4. git の破壊系コマンドが無防備 📖

allow に `Bash(git:*)` があり、deny 側は push 系だけ。以下は無確認で通る:

- `git reset --hard` — 未コミットの作業が消える
- `git clean -fdx` — untracked ファイルが消える
- `git branch -D`
- `git checkout -- .`

### M5. `mv` が無防備 📖

allow に `Bash(mv:*)`。rm を塞いでも `mv important-dir /tmp/x` で実質同じ。

---

## 低 — 限定的、または別ルールで既に守られている

### L1. `~/.ssh/authorized_keys` が deny 対象外 📖

Edit / Write の SSH deny は `id_*` `*_rsa` `*_ecdsa` `*_ed25519` の4パターン
のみ。`authorized_keys` と `config` は含まれない。

### L2. `NotebookEdit` / `MultiEdit` の deny がゼロ 📖

`Edit` 19件 + `Write` 16件は揃えたが、この2ツールは1件もない。
`.ipynb` 経由の書き込みだけルールの外にある。

### L3. git push main/master の exact 一致4件（害はない）📖

```
Bash(git push --force-with-lease origin main)
Bash(git push -f origin main)
Bash(git push --force-with-lease origin master)
Bash(git push -f origin master)
```

前方一致 `Bash(git push --force:*)` / `Bash(git push -f:*)` と hook が実際の
守りなので冗長なだけ。main がデフォルトブランチのリポジトリもあるため
意図的に残している。

---

## 未検証

### U1. allow の `Edit(!...)` 11件 (negation)

```
Edit(!.git/**) Edit(!node_modules/**) Edit(!vendor/**) Edit(!.venv/**)
Edit(!venv/**) Edit(!__pycache__/**) Edit(!target/**) Edit(!dist/**)
Edit(!build/**) Edit(!.next/**) Edit(!coverage/**)
```

`.git/COMMIT_EDITMSG` への Edit がプロンプトなしで通ったが、同じセッションで
`~/` 直下への Write もプロンプトなしで通ったため、negation が無効なのか
permission mode が緩いのかを区別できなかった。

**確認方法**: 通常の permission mode のセッションで `.git/` 配下のファイルを
Edit してみる。プロンプトが出れば negation は有効。

---

## 穴ではなかったもの 🔬

複合コマンドは deny を迂回**できない**。

```console
$ cd /tmp && rm -rf /tmp/claude-probe-nonexistent-xyz
Permission to use Bash with command ... has been denied.
```

Claude Code はシェル演算子を解析してコマンドごとに判定している。
PreToolUse hook の正規表現を直した理由 (`cd x && git push -f` が素通り) は
**hook 側だけの問題**で、deny ルールには最初から当てはまらない。

---

## 今回塞いだもの (対応済み・記録用)

### force push

- deny に前方一致を追加: `Bash(git push --force:*)` `Bash(git push -f:*)`
  `Bash(git push --delete:*)`
- master 版の exact 一致を追加 (main 版は温存)
- PreToolUse hook を追加。正規表現:

  ```
  git[[:space:]]+push([[:space:]][^;&|]*)?[[:space:]]+(--force[^[:space:]]*|-f)([[:space:]]|$)
  ```

  指示文の元案は `(^|[[:space:]])-f` の `^` アンカーのせいで
  `cd x && git push -f` を取り逃し、逆に `git push origin wip-f`
  (ブランチ名) を誤検出していた。

### 死んでいた deny の掃除

| 変更 | 理由 |
|---|---|
| `Bash(rm -rf /)` `Bash(rm -rf ~)` `Bash(rm -rf /*)` `Bash(rm -rf .git)` を削除 | `Bash(rm -rf:*)` `Bash(rm -fr:*)` に吸収 |
| `Bash(> /dev/*)` `Bash(>> /dev/*)` を削除 | リテラル `*` で永久に発火しない。`Edit(/dev/**)` + `Write(/dev/**)` が実際の守り |
| `Bash(sudo shadow:*)` を削除 | `shadow` というコマンドが存在しない |
| `Bash(chmod 777 /*)` → `Bash(chmod 777:*)` | リテラル `*` → 前方一致 |
| `Bash(docker system prune -af)` → `Bash(docker system prune:*)` | exact → 前方一致 |
| allow から `Bash(curl:*)` `Bash(wget:*)` を削除 | deny と重複しており deny が勝つ。矛盾の解消 |
| deny に `Write(...)` 16件を追加 | `Edit(...)` は Write ツール経由の書き込みをハード禁止しない |

### 判明したルール構文の性質

- `*` が前方一致マーカーとして働くのは `:*` が**末尾**にある時だけ。
  それ以外の位置の `*` はリテラル文字として扱われ、そのルールは事実上死ぬ
- `Bash(chown root:*)` は `chown root:root` を書くつもりが `:` を前方一致
  マーカーとして解釈された結果、偶然「`chown root` で始まる全部」を
  カバーしている
- deny は allow より優先される (実測: allow / deny 両方にある `curl` が拒否された)
- deny のツール名はそれぞれ独立して enforce される。
  `Edit(...)` は `Write` / `MultiEdit` / `NotebookEdit` をハード禁止しない

---

## 次のアクション

1. **H1 と H2 を塞ぐ** — どちらも「今日直したはずの防御を迂回できる」ので
   優先度が高い。hook の正規表現追加で対応可能
2. M1〜M5 の方針決め — インタプリタ・sudo・git 破壊系・mv をどこまで縛るか。
   縛りすぎると日常作業が止まるのでトレードオフの判断が要る
3. U1 を通常 mode のセッションで確認する
