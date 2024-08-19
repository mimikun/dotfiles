-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {
    styles = {
        "nightfall",
        "deeper-night",
        "maron",
    },
}

function M.set_theme(theme)
    print("nightfall.nvim setting")

    ---@type table
    local opts = {
        transparent = vim.g.transparent_enabled,
        dim_inactive = false,
        integrations = {
            illuminate = { enabled = false },
        },
    }

    require("nightfall").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
