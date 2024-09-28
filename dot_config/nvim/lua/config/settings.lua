local settings = {}

---use ai assistant
-- NOTE: AI assistants will only be enabled at home
-- (i.e. only if it is a human right)
---@type boolean
settings.use_ai = require("config.global").is_human_rights

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
