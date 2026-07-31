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

## 回帰テスト

**hook の正規表現を触る前に必ず実行すること。**

```console
$ scripts/test-claude-hooks.sh
ok   destructive-git          24 cases
ok   destructive-push         30 cases
ok   interpreter-oneliners    28 cases
ok   recursive-rm             31 cases
---
all 113 cases passed
```

- ランナー: `scripts/test-claude-hooks.sh` (`<文字列>` を渡すと部分一致で絞り込み)
- ケース: `scripts/claude-hooks-cases/*.txt`、1行 `DENY|<コマンド>` または
  `allow|<コマンド>`
- **正規表現は `dot_claude/private_settings.json` から実行時に抽出する。**
  テスト側にコピーを持たないので、設定とテストがドリフトしない。
  ケースファイルの先頭 `# hook: <statusMessage>` で hook を指定する

この日だけで正規表現を3回書き直し、**毎回そこから新しい穴が見つかった**
(`cd x && git push -f` の取り逃し、`git push origin wip-f` の誤検知、
`+refspec` の素通り)。手で確認し直す前提の運用は続かない。

---

## 高 — 対応済み (2026-07-31)

H1 / H2 / H3 は同日に PreToolUse hook で塞いだ。実装と検証結果は末尾
「今回塞いだもの > 第2弾」を参照。以下は経緯の記録として残す。

### H1. `git push origin +branch:branch` (refspec の `+`) 🔬 → 対応済み

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

### H2. `rm -Rf` (大文字 R) 🔬 → 対応済み

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

### H3. `git push origin --delete foo` 📖 → 対応済み

`deny: Bash(git push --delete:*)` は前方一致のみ。`--delete` が `origin` の
後ろに来る形は当たらない。hook も force 系しか見ていない。

---

## 中 — 対応済み (2026-07-31)

M1〜M4 は対応済み、M5 は意図的に対応しない。実装と検証結果は末尾
「今回塞いだもの > 第3弾」を参照。以下は経緯の記録として残す。

### M1. インタプリタ経由の任意操作 📖 → 対応済み

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

### M2. `httpie` / `http` が allow に残っている 📖 → 対応済み

curl / wget は deny 済みだが `http GET ...` で同じことができる。
**`/usr/bin/http` として実際にインストール済み**だったので、実在する
バイパスだった。

### M3. sudo の名指しが11個だけ 📖 → 対応済み

deny にあるのは `sudo rm` `sudo dd` `sudo mkfs` `sudo fdisk` `sudo mount`
`sudo umount` `sudo passwd` `sudo chmod 777` `sudo chown` `sudo -i` `sudo su`
のみ。以下は該当しない:

- `sudo bash -c '...'`
- `sudo tee /etc/passwd`
- `sudo vim /etc/sudoers`

ただし実害は低かった。**この環境の sudo はパスワード必須**で、Claude には
tty がないため sudo コマンドはそもそも完走できない:

```console
$ sudo -n true
sudo: a password is required
```

### M4. git の破壊系コマンドが無防備 📖 → 一部対応済み

allow に `Bash(git:*)` があり、deny 側は push 系だけ。以下は無確認で通る:

- `git reset --hard` — 未コミットの作業が消える
- `git clean -fdx` — untracked ファイルが消える
- `git branch -D`
- `git checkout -- .`

### M5. `mv` が無防備 📖 → 意図的に対応しない

allow に `Bash(mv:*)`。rm を塞いでも `mv important-dir /tmp/x` で実質同じ。

**対応しない理由**: `mv` は移動でありデータは移動先に残る。誤って移動された
場合も戻せる。破壊 (`rm`) と復元可能な移動を同列に扱うと deny が肥大化し、
日常作業のコストだけが増える。`mv x /dev/null` は例外的に破壊的だが、
`Write(/dev/**)` と `Edit(/dev/**)` が別途 deny しており頻度も極めて低い。

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

### 第2弾: H1 / H2 / H3 (同日)

#### hook 1: destructive push (既存 hook を拡張)

```
git[[:space:]]+push([[:space:]][^;&|]*)?[[:space:]]+(["]?\+[^[:space:]]|(--force[^[:space:]]*|--mirror|--delete|-f|-d)([[:space:]]|$))
```

`--force*` / `-f` に加えて `--mirror` / `--delete` / `-d` / `+refspec` を
捕捉するようにした。28ケースでテストし全通過。

実機確認:

```console
$ git push --dry-run origin +refactor/claude:refactor/claude
Destructive push is blocked (force, mirror, delete, or a + refspec).
$ git push --dry-run origin refactor/claude
To github.com:mimikun/dotfiles.git
 * [new branch]  refactor/claude -> refactor/claude   ← 通常の push は通る
```

#### hook 2: recursive rm (新規)

```
(^|[[:space:];&|(/])rm[[:space:]]+([^;&|]*[[:space:]])?(-[a-zA-Z]*[rR][a-zA-Z]*|--recursive)([[:space:]]|$)
```

`-rf` `-fr` `-Rf` `-vrf` `-r -f` `--recursive`、フラグ後置 (`rm /tmp/x -rf`)、
`/bin/rm`、`sudo rm` を全部捕捉。31ケースでテストし全通過。

**方針を1点広げた**: 当初の合意は「`rm -rf` だけ deny」だったが、hook は
**再帰フラグがあれば `-f` の有無を問わず deny** にした。エージェントの
シェルには対話プロンプトに答える人間がいないため、`rm -r` は `rm -rf` と
同じ破壊力を持つ。`-f` の有無で線を引くと、また「守っているつもりで
素通り」になる。

`rm file` / `rm -f file` / `rm -i` / `rmdir` は通るので日常作業は止まらない。

実機確認:

```console
$ rm -Rf /tmp/claude-probe-nonexistent-xyz3
Recursive rm is blocked. Run it by hand if you really need it.
$ rm -f /tmp/.../probe2.txt
(通った)
```

#### 既知のトレードオフ

- **`git rm -r --cached x` も止まる。** `rm` の前が空白であれば拾う設計の
  ため。POSIX ERE に後読みがなく `git rm` だけを除外できない。除外を
  別 grep で書くと `git rm -r a && rm -rf b` が丸ごと素通りするので、
  誤検知 (手で打ち直すだけ) より取り逃し (実害) を避ける側に倒した
- **シングルクォートされた refspec `git push origin '+master'` は未対応。**
  hook のコマンド文字列がシェルのシングルクォートで囲まれており、
  正規表現内に `'` を書けないため。ダブルクォートと裸の `+` は対応済み
- **hook はコマンド文字列を見るだけなので、内容に言及しただけでも止まる。**
  例えばこのドキュメントを heredoc で編集しようとすると、本文に
  `git push origin --delete foo` が含まれるため deny される。
  ファイル編集は Edit / Write ツールを使えば回避できる

### 第3弾: M1 / M2 / M3 / M4 (同日)

#### hook 3: destructive git (新規)

```
git[[:space:]]+(clean([[:space:]][^;&|]*)?[[:space:]]+(-[a-zA-Z]*f[a-zA-Z]*|--force)([[:space:]]|$)|reset([[:space:]][^;&|]*)?[[:space:]]+--hard([[:space:]]|$))
```

`git clean` は `-f` / `--force` を伴う場合のみ deny。`git clean -n` /
`--dry-run` は通る (git は `-f` なしでは何も削除しないため)。
`git reset --hard` はフラグ後置 (`git reset HEAD~1 --hard`) も捕捉。

**`git branch -D` と `git checkout -- .` は対象外**にした。reflog と
git-ai checkpoint (PreToolUse / PostToolUse で全ツール呼び出しごとに
スナップショット) で復旧できる。戻せないのは `git clean` の untracked
削除なので、そこを優先した。

24ケースでテストし全通過。実機確認:

```console
$ git reset --hard HEAD
git clean --force and git reset --hard are blocked.
$ git reset
Unstaged changes after reset: ...          ← --hard なしは通る
$ git clean --dry-run
(通った)
```

#### hook 4: interpreter one-liners (新規)

2つの grep の **AND** で判定する。片方だけでは発火しない。

条件1 — ワンライナー実行の形:

```
(^|[[:space:];&|(/])(python[0-9.]*|node|deno|bun|perl|ruby)[[:space:]]+([^;&|]*[[:space:]])?(-[a-zA-Z]*[cep]([[:space:]]|$)|--eval([[:space:]]|=)|eval([[:space:]]|$))
```

条件2 — 危険なシンボルを含む:

```
(rmtree|shutil|subprocess|child_process|execSync|spawnSync|os\.system|os\.popen|os\.remove|os\.rmdir|unlink|rmSync|rmdirSync|Deno\.remove|Deno\.run|Deno\.Command|FileUtils|File\.delete|Dir\.delete|\.rmdir|truncate)
```

`python -c "print(2**10)"` のような計算用ワンライナーは通り、
`python -c "import shutil; ..."` は止まる。スクリプトファイル実行
(`python script.py`) も通る。28ケースでテストし全通過。

実機確認:

```console
$ python3 -c "import shutil; print('would rmtree')"
Interpreter one-liner touching file removal or process spawning is blocked.
$ python3 -c "print(2**10)"
1024
$ node -e "console.log('ok')"
ok
```

**限界**: これは網羅的な防御ではない。`getattr(__import__('sh'+'util'), ...)`
のような文字列分割は当然すり抜ける。**allow に `Bash(python:*)` がある以上、
インタプリタ経由の任意操作を hook で完全に塞ぐことは原理的に不可能**で、
これは「うっかり」を止める層として入れている。完全に塞ぐなら allow から
インタプリタを外すしかない。

#### deny の変更

| 変更 | 理由 |
|---|---|
| sudo 系11件を `Bash(sudo:*)` 1件に統合 | 名指し列挙は必ず取り逃す (`sudo bash` `sudo tee` `sudo vim` が漏れていた)。この環境の sudo はパスワード必須で Claude には tty がないため、全面 deny の実害はゼロ |
| `Bash(http:*)` `Bash(httpie:*)` を deny に追加、allow から削除 | curl / wget を deny していても httpie で同じことができた。`/usr/bin/http` として実在 |

### 第1弾: 死んでいた deny の掃除

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

1. ~~H1 と H2 を塞ぐ~~ — 2026-07-31 対応済み (H3 も同時に対応)
2. ~~M1〜M5 の方針決め~~ — 2026-07-31 対応済み (M5 は意図的に対応しない)
3. **L1 (`~/.ssh/authorized_keys`) と L2 (`NotebookEdit` / `MultiEdit` の
   deny がゼロ)** — deny に数行足すだけ。残作業のうち最も費用対効果が高い
4. **U1 を通常 mode のセッションで確認する** — `Edit(!...)` の negation が
   効いているかどうか。効いていないなら allow の11行は削除できる
5. ~~回帰テストをリポジトリに置く~~ — 2026-07-31 対応済み。
   `scripts/test-claude-hooks.sh` (113ケース)。冒頭「回帰テスト」を参照
