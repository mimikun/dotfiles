local global = require("config.global")

local is_windows = global.is_windows
local is_linux = global.is_linux
local is_work = global.is_work
local is_home = global.is_home
local is_azusa = global.is_azusa

local settings = {}

---need all colorschemes
---@type boolean
local need_all_colorschemes = false

---need all treesitter parsers
---@type boolean
local need_all_parsers = false

---need all lspconfig servers
---@type boolean
local need_all_servers = false

---need all telescope extensions
---@type boolean
local need_all_exts = false

---use GitHub Copilot
-- NOTE: only be enabled at Home-windows, Home-WSL and Home-azusa
local use_github_copilot = is_home and true or false

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
---@type boolean
local use_codecompanion = check_codecompanion()

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
---@type boolean
local use_avante = check_avante()

---use denops
---@type boolean
local use_denops = true

---use blink.cmp
---@type boolean
local use_blink_cmp = true

---@type boolean
local is_throttling = false

-- use llm feature, only enable home and linux(WSL)
---@type boolean
local use_llm = is_home and is_linux

---@type boolean
local use_minuet = false

---@type boolean
local use_dashboard_image = false

---@type boolean
local use_claude_code = is_home and is_linux

settings.need_all_colorschemes = need_all_colorschemes
settings.need_all_parsers = need_all_parsers
settings.need_all_servers = need_all_servers
settings.need_all_exts = need_all_exts
settings.use_github_copilot = use_github_copilot
settings.use_codecompanion = use_codecompanion
settings.use_avante = use_avante
settings.use_denops = use_denops
settings.use_blink_cmp = use_blink_cmp
settings.is_throttling = is_throttling
settings.use_llm = use_llm
settings.use_minuet = use_minuet
settings.use_dashboard_image = use_dashboard_image
settings.use_claude_code = use_claude_code

return settings
