-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type table
local theme_opts = {
    transparent_background = vim.g.transparent_enabled,
}

---@type Huez.ThemeConfig
local M = {
    styles = {
        "zenbones",
        "zenwritten",
        "neobones",
        "rosebones",
        "forestbones",
        "tokyobones",
        "seoulbones",
        "kanagawabones",
        "randombones",
        -- light only
        "vimbones",
        -- dark only
        "duckbones",
        "nordbones",
        "zenburned",
    },
}

function M.set_theme(theme)
    vim.g.zenbones = theme_opts
    vim.g.zenwritten = theme_opts
    vim.g.neobones = theme_opts
    vim.g.rosebones = theme_opts
    vim.g.forestbones = theme_opts
    vim.g.tokyobones = theme_opts
    vim.g.seoulbones = theme_opts
    vim.g.kanagawabones = theme_opts
    vim.g.randombones = theme_opts
    -- light only
    vim.g.vimbones = theme_opts
    -- dark only
    vim.g.duckbones = theme_opts
    vim.g.nordbones = theme_opts
    vim.g.zenburned = theme_opts
    vim.cmd("colorscheme " .. theme)
    return true
end

return M
