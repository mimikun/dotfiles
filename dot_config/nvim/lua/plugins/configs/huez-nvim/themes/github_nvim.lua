-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua
---@type Huez.ThemeConfig
local M = {
    styles = {
        "github_dark",
        "github_dark_colorblind",
        "github_dark_dimmed",
        "github_dark_high_contrast",
        "github_dark_tritanopia",
        "github_light",
        "github_light_colorblind",
        "github_light_high_contrast",
        "github_light_tritanopia",
        "github_dimmed",
    },
}

function M.set_theme(theme)
    print("github-nvim-theme setting")

    ---@type GhTheme.Config.Options
    local opts = {
        transparent = vim.g.transparent_enabled,
    }

    require("github-theme").setup(opts)

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
