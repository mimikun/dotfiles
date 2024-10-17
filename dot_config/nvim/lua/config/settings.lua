local global = require("config.global")

local settings = {}

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

---use GitHub Copilot
-- NOTE: only be enabled at Home-machines
settings.use_github_copilot = global.is_home and true or false

local check_codecompanion = function()
    if global.is_azusa then
        return true
    else
        if global.is_work then
            if global.is_windows then
                return true
            else
                return false
            end
        end
        --return global.is_windows and true or false
    end
end

---use Codecompanion.nvim ollama
-- NOTE: only be enabled at Home-azusa and Work-machines
settings.use_codecompanion = check_codecompanion()

return settings
