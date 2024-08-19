-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    print("nord setting")

    vim.g.nord_disable_background = vim.g.transparent_enabled

    vim.cmd("colorscheme " .. theme)
    return true
end

return M