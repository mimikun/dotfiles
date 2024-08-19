-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    print("gaming setting")

    -- NOTE: Not support "transparent = true"

    -- N ms colors cycle
    vim.g["gaming#period"] = 500
    -- Updating colors every N ms
    vim.g["gaming#update_time"] = 50

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
