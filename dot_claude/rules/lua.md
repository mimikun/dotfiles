---
paths:
  - "**/*.lua"
---

# Lua

- **フォーマッタ:** `stylua` — インデント2スペース、ダブルクォート、呼び出しには常に括弧を付ける（`require("x")`）
- **リンタ:** `selene`
- **コミット前チェック:** `stylua --check . && selene .`
- 対象は **Lua 5.1 / LuaJIT** — Lua 5.3 以降の構文（ビット演算 `&`/`|`/`~`、整数除算 `//`）は使わない。`bit` ライブラリを使う
- **Neovim の設定:** 旧来の vimscript より `vim.opt.*` / `vim.api.*` を優先する。任意の `require()` は `pcall` で囲む
