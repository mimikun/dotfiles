-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    print("sweetie.nvim setting")

    ---@type table
    local opts = {
        -- NOTE: Not support "transparent = true"
    }

    require("sweetie").setup(opts)

    vim.g.sweetie = {
        pumblend = {
            enable = true,
            transparency_amount = 100,
        },
        integrations = {
            lazy = true,
            neorg = true,
            neogit = true,
            neomake = true,
            telescope = true,
        },
        cursor_color = true,
        terminal_colors = true,
    }

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
