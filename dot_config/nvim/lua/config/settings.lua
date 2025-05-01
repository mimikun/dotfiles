local global = require("config.global")

local is_windows = global.is_windows
local is_linux = global.is_linux
local is_work = global.is_work
local is_home = global.is_home
local is_azusa = global.is_azusa

local settings = {}

---need all colorschemes
---@type boolean
settings.need_all_colorschemes = false

---need all treesitter parsers
---@type boolean
settings.need_all_parsers = false

---need all lspconfig servers
---@type boolean
settings.need_all_servers = false

---need all telescope extensions
---@type boolean
settings.need_all_exts = false

---use GitHub Copilot
-- NOTE: only be enabled at Home-windows, Home-WSL and Home-azusa
settings.use_github_copilot = is_home and true or false

---check if Codecompanion.nvim (ollama adapter) is available
local check_codecompanion = function()
    if is_azusa then
        return true
    else
        if is_work then
            if is_windows then
                return true
            else
                return false
            end
        end
    end
end

---use Codecompanion.nvim (ollama adapter)
-- NOTE: only be enabled at Home-azusa and Work-Windows
settings.use_codecompanion = check_codecompanion()

---check if avante.nvim is available
local check_avante = function()
    if is_azusa then
        return true
    else
        if is_work then
            if is_windows then
                return true
            else
                return false
            end
        end
    end
end

---use avante.nvim
-- NOTE: only be enabled at Home-azusa and Work-Windows
settings.use_avante = check_avante()

---use denops
-- NOTE: only be enabled at Home-azusa and Home-WSL
local use_denops = (is_home and is_linux) and true or false
settings.use_denops = use_denops

---use blink.cmp
settings.use_blink_cmp = true

---@type boolean
local is_throttling = false
settings.is_throttling = is_throttling

-- use llm feature, only enable home and linux(WSL)
---@type boolean
local use_llm = is_home and is_linux
settings.use_llm = use_llm

---@type boolean
local use_minuet = false
settings.use_minuet = use_minuet

---@type boolean
local use_dashboard_image = false
settings.use_dashboard_image = use_dashboard_image

return settings
