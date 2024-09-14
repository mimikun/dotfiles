local settings = {}

---use ai assistant
---@type boolean
settings.use_ai = false

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

return settings
