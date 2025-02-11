-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    ---@type table
    local opts = {
        italic_comments = true,
        disable_cache = false,
        hot_reload = false,
    }

    require("retro-theme").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
