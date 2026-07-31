久し振りにClaudeを起動したら設定ファイルに誤りがあったらしく警告が出ました。
適切に修正してほしいです。

```shell
 Invalid Settings
 /home/mimikun/.claude/settings.json
  └ permissions
    ├ allow
    │ └ "WebSearch(*)": WebSearch does not support wildcards. Use exact search terms without * or ?. Examples:
  WebSearch(claude ai), WebSearch(typescript tutorial)
    └ deny
      ├ "Bash(sudo:*passwd*)": The :* pattern must be at the end. Move :* to the end for prefix matching. Examples:
  Bash(npm run:*), Bash(git commit:*)
      ├ "Bash(sudo:*shadow*)": The :* pattern must be at the end. Move :* to the end for prefix matching. Examples:
  Bash(npm run:*), Bash(git commit:*)
      ├ "Bash(curl * | sh)": Wildcards in the middle of commands are not supported. Use prefix matching with ":*" or
  specify exact commands. Examples: Bash(npm run:*) - allows any npm run command, Bash(npm install express) - allows
  exact command, Bash - allows all commands
      ├ "Bash(curl * | bash)": Wildcards in the middle of commands are not supported. Use prefix matching with ":*" or
  specify exact commands. Examples: Bash(npm run:*) - allows any npm run command, Bash(npm install express) - allows
  exact command, Bash - allows all commands
      ├ "Bash(wget * | sh)": Wildcards in the middle of commands are not supported. Use prefix matching with ":*" or
  specify exact commands. Examples: Bash(npm run:*) - allows any npm run command, Bash(npm install express) - allows
  exact command, Bash - allows all commands
      └ "Bash(wget * | bash)": Wildcards in the middle of commands are not supported. Use prefix matching with ":*" or
  specify exact commands. Examples: Bash(npm run:*) - allows any npm run command, Bash(npm install express) - allows
  exact command, Bash - allows all commands
```

変えてほしいファイルの実体は @ ../../dot_claude/settings.json にあります。

## 実行結果 (2025-10-16)

### 修正内容

#### Allow セクション
- **削除**: `WebSearch(*)` (line 208)
  - 理由: WebSearchはワイルドカードをサポートしていないため削除

#### Deny セクション
1. **修正**: `Bash(sudo:*passwd*)` → `Bash(sudo passwd:*)` (line 266)
   - 理由: `:*`パターンは末尾にのみ配置可能

2. **修正**: `Bash(sudo:*shadow*)` → `Bash(sudo shadow:*)` (line 267)
   - 理由: `:*`パターンは末尾にのみ配置可能

3. **置換**: パイプコマンドのワイルドカード (lines 274-277)
   - `Bash(curl * | sh)` → 削除
   - `Bash(curl * | bash)` → 削除
   - `Bash(wget * | sh)` → 削除
   - `Bash(wget * | bash)` → 削除
   - 追加: `Bash(curl:*)`
   - 追加: `Bash(wget:*)`
   - 理由: コマンド中のワイルドカードはサポートされていないため、より広範な拒否ルールに変更

### セキュリティへの影響

- `curl`と`wget`のすべての実行を拒否することで、元の意図（危険なパイプ実行の防止）を保ちつつ、より広範なセキュリティを実現
- ただし、allowリストに `Bash(curl:*)` と `Bash(wget:*)` が含まれているため、実際には許可される
- より厳密な制御が必要な場合は、allowリストから削除することを検討

### ファイル
- 修正対象: `/home/mimikun/.claude/settings.json`
- 同期対象: `@dot_claude/settings.json` (chezmoi管理下)

## 訂正 (2026-07-31)

上記「セキュリティへの影響」の記述に誤りがあったので訂正する。

### 誤り1: deny と allow の優先順位が逆

> ただし、allowリストに `Bash(curl:*)` と `Bash(wget:*)` が含まれているため、
> 実際には許可される

**実際は deny が勝つ。** 実測で確認済み:

```console
$ curl --version
Permission to use Bash with command curl --version has been denied.
```

つまり 2025-10-16 の時点から curl / wget は**完全に封鎖されていた**。
「許可される」と書いてあるので、封鎖されている自覚がないまま10ヶ月弱運用
していたことになる。

2026-07-31 に、同ドキュメントの提案どおり allow 側から
`Bash(curl:*)` `Bash(wget:*)` を削除した。deny は残っているので挙動は
変わらないが、設定から意図が読めるようになった。

### 誤り2: `Bash(sudo shadow:*)` は無意味なルールだった

`Bash(sudo:*shadow*)` → `Bash(sudo shadow:*)` の書き換えは構文エラーは
消えたが、**`shadow` というコマンドは存在しない**ため一度も発火しない
ルールになっていた。

```console
$ command -v shadow
(何も出ない)
```

元の意図 (`/etc/shadow` の保護) は `Edit(/etc/shadow)` と
`Edit(/etc/**)` が既に担当しているため、2026-07-31 に削除した。

**教訓**: 構文エラーを消すだけの機械的な修正は、意味が通らないルールを
生む。書き換え後に「そのコマンドは実在するか」「実際に発火するか」を
確認する必要がある。

### 関連

現在の残存穴は [claude-permission-holes-20260731.md](claude-permission-holes-20260731.md) を参照。
