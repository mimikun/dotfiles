---
paths:
  - "**/*.lua"
---

# Lua

- **Formatter:** `stylua` — 2-space indent, double quotes, always parenthesize calls (`require("x")`)
- **Linter:** `selene`
- **Pre-commit checks:** `stylua --check . && selene .`
- Target **Lua 5.1 / LuaJIT** — NEVER use Lua 5.3+ syntax (bitwise `&`/`|`/`~`, integer division `//`); use the `bit` library
- **Neovim configs:** prefer `vim.opt.*` / `vim.api.*` over legacy vimscript; guard optional `require()` with `pcall`
