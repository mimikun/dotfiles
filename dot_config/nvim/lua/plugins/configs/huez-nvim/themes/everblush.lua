-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    print("everblush.nvim setting")

    ---@type table
    local opts = {
        transparent_background = vim.g.transparent_enabled,
        nvim_tree = {
            contrast = false,
        },
    }

    require("everblush").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
