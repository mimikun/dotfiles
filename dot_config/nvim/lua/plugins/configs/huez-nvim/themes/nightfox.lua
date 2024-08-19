-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {
    styles = {
        "nightfox",
        "carbonfox",
        "dawnfox",
        "dayfox",
        "duskfox",
        "nordfox",
        "terafox",
    },
}

function M.set_theme(theme)
    print("nightfox.nvim setting")

    ---@type table
    local opts = {
        options = {
            transparent = vim.g.transparent_enabled,
            -- Non focused panes set to alternative background
            dim_inactive = false,
            -- Default enable value for modules
            module_default = true,
            colorblind = {
                -- Enable colorblind support
                enable = false,
                -- Only show simulated colorblind colors and not diff shifted
                simulate_only = false,
            },
        },
    }

    require("nightfox").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
