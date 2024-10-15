local global = require("config.global")

local settings = {}

---use GitHub Copilot
-- NOTE: GitHub Copilot will only be enabled at home
---@type boolean
settings.use_github_copilot = use_github_copilot

---use ollama
-- NOTE: ollama will only be enabled at work
---@type boolean
settings.use_ollama = not use_github_copilot

---use ai assistant
-- NOTE: AI assistants will only be enabled at home
-- (i.e. only if it is a human right)
---@type boolean
settings.use_ai = global.is_human_rights

---use denops
---@type boolean
settings.use_denops = false

---need all colorschemes
---@type boolean
settings.need_all_colorschemes = false

---need all treesitter parsers
---@type boolean
settings.need_all_parsers = false

---need all lspconfig servers
---@type boolean
settings.need_all_servers = false

-- NOTE: Only one can be set to TRUE
---@type boolean
settings.use_none_ls = true

---@type boolean
settings.use_efmls = false

---@type boolean
settings.use_conform = false

---@type boolean
settings.use_guard = false

---need all telescope extensions
---@type boolean
settings.need_all_exts = false

return settings
