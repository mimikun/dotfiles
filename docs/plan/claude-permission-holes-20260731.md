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
`Edit(/dev/**)` が別途 deny しており頻度も極めて低い。

---

## 低 — 対応済み (2026-07-31)

L1 は対応済み、L2 は誤診 (第5弾で撤回)、L3 は対応不要。実装は末尾
「今回塞いだもの > 第4弾 / 第5弾」を参照。以下は経緯として残す。

### L1. `~/.ssh/authorized_keys` が deny 対象外 📖 → 対応済み

Edit / Write の SSH deny は `id_*` `*_rsa` `*_ecdsa` `*_ed25519` の4パターン
のみ。`authorized_keys` と `config` は含まれない。

### L2. `NotebookEdit` / `MultiEdit` の deny がゼロ 📖 → **穴ではなかった**

`Edit` 19件 + `Write` 16件は揃えたが、この2ツールは1件もない。
`.ipynb` 経由の書き込みだけルールの外にある。

**→ 誤診 (第5弾)。** `Edit(path)` が全ファイル編集ツールをカバーするため、
`NotebookEdit` / `MultiEdit` に deny が0件なのは正常。ここで足した13件も、
`Write` の16件も、第5弾で削除した。

### L3. git push main/master の exact 一致4件（害はない）📖 → 対応不要

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

### U1. allow の `Edit(!...)` 11件 (negation) ✅ 2026-07-31 決着 — negation は無効だった

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

#### 2026-07-31 追記: 未確認だが、無効より危険な可能性がある

第5弾でバイナリを読んだ際の副産物。**確定していない仮説として扱うこと。**

- バイナリには picomatch が同梱されており、`nonegate` を渡さない限り
  **先頭の `!` をパターン全体の否定として解釈する**
  (`if(r.nonegate!==!0 && L.index===0){V();continue}`)
- permission 層に `startsWith("!")` の分岐は見当たらなかった。つまり `!` は
  そのまま glob matcher へ渡っている可能性が高い

もしそうなら `Edit(!.git/**)` は **allow** リストにあるので、
「`.git/**` 以外のすべてを許可する」ルールとして働く。意図
(「`.git/**` を許可から除外する」) の**逆**であり、11件それぞれが
事実上の全面 allow になる。

**未確認の理由**: permission matcher の呼び出し箇所を 262MB のバンドルから
特定できなかった (正規表現探索がタイムアウト)。上記は「picomatch が同梱
されている」「permission 層に `!` の分岐がない」の2点からの推測にすぎない。

**確認方法は変わらない**が、優先度は上がる。無効なだけなら 11行が無駄なだけ
だが、この仮説が当たっていれば allow が意図せず広がっている。

#### 2026-07-31 決着: manual mode で3回 probe した

`⏸ manual mode on` (内部名 `default`。`shift+tab` の `chat:cycleMode` で切替) で実測。

| # | 対象 | プロンプト | 読み取れること |
|---|---|---|---|
| 1 | `.git/description` | 出た | **判定不能**。下記の落とし穴を参照 |
| 2 | `/tmp/u1-probe.txt` | 出た | picomatch 全体否定説を**否定**。かつ「プロンプトが出る状態」の対照実験 |
| 3 | `node_modules/u1-probe.txt` | **出なかった** | `Edit(./**)` が通し、`Edit(!node_modules/**)` は**除外しなかった** |

**結論: `!` は単に無視されている。** 危険な全面 allow ではなかったが、
意図した保護は最初から一度も存在していなかった。

**テスト設計の落とし穴 (probe 1 が使えなかった理由)**: 当初は
「`.git/` 配下を Edit してプロンプトが出れば negation は有効」で判定する
つもりだったが、glob の `**` は**デフォルトでドット始まりの要素にマッチしない**。
`.git` `.venv` `.next` はこれで偶然守られており、`Edit(./**)` にそもそも
拾われていない。**ドットを含まないパス (`node_modules/`) を使わないと
negation の有無を分離できない。** 同じ確認をやり直す人は probe 3 だけでよい。

#### 対応: `permissions.ask` へ移した

11件を allow から削除し、`permissions.ask` に `Edit(**/<dir>/**)` として置いた。

- `ask` はバイナリ上で第一級のリスト
  (`{allow:"alwaysAllowRules", deny:"alwaysDenyRules", ask:"alwaysAskRules"}`)。
  UI にも「Explicit ask/deny rules are always respected」とある
- **`deny` ではなく `ask` を選んだ理由**: node_modules を意図的にパッチする
  場面が実在する。`deny` はハードブロックで手詰まりになるが、`ask` なら
  聞かれるだけ。「自動許可はするな、聞け」という元の意図と完全に一致する
- パターンを `**/<dir>/**` にしたのは、ネストした `packages/x/node_modules/`
  と絶対パス両方を拾わせるため。旧ルールの `node_modules/**` は先頭一致に
  依存していた

#### ✅ 2026-07-31 実測: 11件は発火する

再起動後の manual mode セッションで probe した。

```console
$ mkdir -p node_modules && printf x > node_modules/ask-probe.txt
# manual mode で node_modules/ask-probe.txt を Edit → プロンプトが出た
$ rm node_modules/ask-probe.txt && rmdir node_modules
```

**プロンプトが出た。** 同じパスは `allow` の `Edit(./**)` にも一致するので、
これは同時に **`ask` が `allow` に優先する**ことの実測でもある
(移行前の probe 3 では同じパスがプロンプトなしで通っていた。差分は
`permissions.ask` の追加だけ)。

これで「設定同士の整合性は発火の証拠にならない」(第5弾の教訓) の宿題は完了。

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

### 第5弾: 第4弾の撤回 — `Write(...)` / `NotebookEdit(...)` 26件を削除 (同日)

第4弾の直後から、Claude 起動のたびに26件の警告が出るようになった:

```
Permission deny rule (.claude/settings.json): Write(/etc/**) is not matched by
file permission checks — only Edit(path) rules are. Use Edit(/etc/**) instead
(Edit rules cover all file-editing tools).
```

**第4弾の前提が逆だった。** バイナリ (2.1.220) の該当ロジック:

```js
let a = o.toolName==="Write" || o.toolName==="NotebookEdit" || o.toolName==="MultiEdit"
      ? "Edit"
      : o.toolName==="Glob" ? "Read" : void 0;
if (a !== void 0 && !o.ruleContent.includes(":*"))
  return { valid:!0, warning:`... is not matched by file permission checks — only ${a}(path) rules are ...` };
```

つまり:

- ファイル権限チェックは **`Edit(path)` ルールしか読まない**。
  `Write(path)` / `NotebookEdit(path)` / `MultiEdit(path)` は**参照すらされない**
- `Edit(path)` の側が `Edit` / `Write` / `MultiEdit` / `NotebookEdit` を**まとめて**カバーする
- 同じ扱いが Read 系にもある (`Glob(path)` は死に、`Read(path)` がカバーする)
- glob パターンを取るツールは
  `["Read","Write","Edit","Glob","NotebookRead","NotebookEdit","Cd"]` (`filePatternTools`)。
  この中で `:*` を書くと **valid:false のエラー**になる。`:*` の前方一致は
  `Bash(...)` 専用で、ファイル系ルールの逃げ道にはならない
- `MultiEdit` は `filePatternTools` に入っていない (第4弾で見送ったのは結果的に正解)

よって追加した26件は、`Bash(sudo shadow:*)` と同種の**発火しないルール**だった。
削除しても保護は一切落ちない — 13パターンはすべて `Edit(...)` 側に残っている。

第4弾の「実機確認」で `Write(~/.ssh/probe.txt)` がブロックされたのは、
`Write(~/.ssh/**)` ではなく `Edit(~/.ssh/**)` が発火した結果。第4弾で
「未確認」としていた点は、これで確認できたことになる。

**`MultiEdit` 見送りの判断は結果的に正しかった** (理由は違うが)。ツール一覧に
`MultiEdit` が現れても、`Edit(...)` がカバーするので複製は不要になった。

#### 教訓

**警告を出さない設定は「正しい」の証拠にならないが、警告を出す設定は「間違い」
の証拠になる。** 第4弾は3ツールに揃えた md5 検算までやって整合性を確認したが、
検算したのは *設定同士の一致* であって *設定が読まれるか* ではなかった。
`~/.claude/rules/general.md` の「バイナリに対して grep して検証しろ」は、
env var だけでなく **permission ルールのツール名にも適用する**。

### 第4弾: L1 / L2 (同日) — ⚠️ 一部撤回、第5弾を参照

ファイル系 deny を **Edit / Write / NotebookEdit の3ツールで同一の13パターン**
に揃えた。

```
/etc/** /usr/** /var/** /opt/** /bin/** /sbin/** /lib/** /lib64/**
/boot/** /proc/** /sys/** /dev/** ~/.ssh/**
```

検算 (3ツールのパスリストが完全一致することの確認):

```console
$ for t in Edit Write NotebookEdit; do ... | sort | md5sum; done
3fe9daed33c5dd94227eb5e7c6838b7e  Edit
3fe9daed33c5dd94227eb5e7c6838b7e  Write
3fe9daed33c5dd94227eb5e7c6838b7e  NotebookEdit
```

#### L1: SSH のパターン列挙を `~/.ssh/**` に統合

`id_*` `*_rsa` `*_ecdsa` `*_ed25519` の4パターンをやめ、`~/.ssh/**` 1つにした。

**列挙をやめた理由**: `authorized_keys` と `config` が漏れていた。しかも
`~/.ssh/` は chezmoi 管理下 (`.ssh/config`、`.ssh/conf.d/*`) なので、
そもそも直接編集はドリフトになる。編集はソース側の `private_dot_ssh/` で
行うべきで、`~/.ssh/**` を丸ごと deny しても失うものがない。

実機確認:

```console
$ Write(~/.ssh/claude-permission-probe.txt)
File is in a directory that is denied by your permission settings.
```

#### L2: NotebookEdit を追加、MultiEdit は意図的に見送り

`NotebookEdit` は同じ13パターンを追加した。

**`MultiEdit` は追加しなかった。** このバージョン (2.1.220) でエージェントに
露出しているファイル編集ツールは `Edit` / `Write` / `NotebookEdit` の3つで、
`MultiEdit` は含まれない。バイナリ内の出現数も `Edit` 17 / `Write` 20 /
`NotebookEdit` 6 に対して `MultiEdit` は 2 で、過去の文言の残骸に見える。

存在しないツールに deny を足すのは `Bash(sudo shadow:*)` と同じ轍
(発火しないルールが「守られている」という誤った安心を生む) なので、
ルールではなくこの判断を残す。

**再確認のトリガー**: ツール一覧に `MultiEdit` が現れたら、上の13パターンを
`MultiEdit(...)` にも複製する。

#### L3: 対応不要

git push main/master の exact 一致4件は、前方一致と hook が実際の守りなので
冗長なだけで害がない。main がデフォルトブランチのリポジトリもあるため
意図的に残す。変更なし。

#### 未確認のまま残った点 → 第5弾で解決

`Write(~/.ssh/**)` は permission settings 由来のメッセージでブロックされる
ことを確認したが、**`Edit(...)` 側のルールが発火することは今回独立に確認
できていない。** `/proc/version` への Edit で試したところ、permissions
より上流の auto mode classifier に先に止められたため。

→ 第5弾で判明: あのとき実際に発火していたのは `Edit(~/.ssh/**)` の方だった。

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
| `Bash(> /dev/*)` `Bash(>> /dev/*)` を削除 | リテラル `*` で永久に発火しない。`Edit(/dev/**)` が実際の守り |
| `Bash(sudo shadow:*)` を削除 | `shadow` というコマンドが存在しない |
| `Bash(chmod 777 /*)` → `Bash(chmod 777:*)` | リテラル `*` → 前方一致 |
| `Bash(docker system prune -af)` → `Bash(docker system prune:*)` | exact → 前方一致 |
| allow から `Bash(curl:*)` `Bash(wget:*)` を削除 | deny と重複しており deny が勝つ。矛盾の解消 |
| ~~deny に `Write(...)` 16件を追加~~ | ~~`Edit(...)` は Write ツール経由の書き込みをハード禁止しない~~ **誤り。第5弾で全削除** |

### 判明したルール構文の性質

- `*` が前方一致マーカーとして働くのは `:*` が**末尾**にある時だけ。
  それ以外の位置の `*` はリテラル文字として扱われ、そのルールは事実上死ぬ
- `Bash(chown root:*)` は `chown root:root` を書くつもりが `:` を前方一致
  マーカーとして解釈された結果、偶然「`chown root` で始まる全部」を
  カバーしている
- deny は allow より優先される (実測: allow / deny 両方にある `curl` が拒否された)
- **ルール内の先頭 `!` (negation) は効かない。** 無視される (実測: U1)。
  「allow から一部を除外する」は `!` では書けない。`permissions.ask` を使う
- **glob の `**` はドット始まりの要素にマッチしない。** `Edit(./**)` は
  `.git/` `.venv/` `.next/` を拾わない。保護しているつもりで
  「たまたま当たっていない」状態を作らないこと
- ~~deny のツール名はそれぞれ独立して enforce される~~ — **逆だった (第5弾)**。
  ファイル系ルールは `Edit(path)` だけが読まれ、`Edit(...)` が
  `Write` / `MultiEdit` / `NotebookEdit` をまとめてカバーする。
  読み取り系も同様に `Read(path)` が `Glob` をカバーする

---

## 次のアクション

1. ~~H1 と H2 を塞ぐ~~ — 2026-07-31 対応済み (H3 も同時に対応)
2. ~~M1〜M5 の方針決め~~ — 2026-07-31 対応済み (M5 は意図的に対応しない)
3. ~~L1 と L2~~ — 2026-07-31 対応済み (L1 のみ。L2 は誤診で第5弾にて撤回、L3 は対応不要)
4. ~~回帰テストをリポジトリに置く~~ — 2026-07-31 対応済み。
   `scripts/test-claude-hooks.sh` (113ケース)。冒頭「回帰テスト」を参照
5. ~~U1 を通常 mode のセッションで確認する~~ — 2026-07-31 決着。negation は無効。
   11件を削除し `permissions.ask` に移した
6. ~~`Edit(...)` 系 deny が実際に発火することの確認~~ — 2026-07-31 解決。
   第4弾で「`Write` 側が確認済み」としたブロックは、実は `Edit(~/.ssh/**)`
   が発火したものだった (第5弾)
7. ~~`permissions.ask` の11件が実際に発火するか確認する~~ — 2026-07-31 実測済み。
   プロンプトが出た。U1 §「2026-07-31 実測」を参照
8. ~~26件の警告が消えたことの確認~~ — 2026-07-31 実測済み。再起動後の起動時、
   警告は1件も出なくなった (第5弾の削除で解決)

**このドキュメントの未着手項目はゼロ。** 以降は下記「将来の方針」だけが残る。

## 将来の方針: hook を bash スクリプトに切り出して `dot_claude/hooks/` へ置く

**現時点では着手しない。** 方針として書いておく。

- 現状: hook 4本が `dot_claude/private_settings.json` の
  `hooks.PreToolUse` に JSON 文字列として直接埋まっている。正規表現が
  JSON エスケープの中にあり、読むのも直すのも辛い
- 移行先: `dot_claude/hooks/` 配下の bash スクリプト。settings.json 側は
  スクリプトを呼ぶだけにする。`executable_check-settings-env.sh` と
  `executable_herdr-agent-state.sh` が既にこの形なので、置き場も命名も
  既存に倣えばよい
- 外部ツール (cchook 等) は採用しない。依存が増えず、`shellcheck` がそのまま
  かかり、chezmoi の `executable_` 接頭辞だけで配布が済む

**移行時に必ず対応が要る点**: `scripts/test-claude-hooks.sh` は
`dot_claude/private_settings.json` から `statusMessage` をキーに hook
コマンドを抽出している。hook の実体がスクリプトへ出ると**この抽出が空振り
してテストが全 FAIL する**。移行の際は、ランナーの抽出元を
`dot_claude/hooks/*.sh` に差し替えること。テストを消してはいけない —
正規表現は3回書き直して3回とも穴が見つかっている。

なお切り出しはテストにとって追い風でもある: スクリプト化すれば
ランナーが JSON をパースせず**スクリプトを直接呼べる**ようになり、
「設定から抽出したコマンド」と「実際に走るコマンド」がずれる余地が消える。
