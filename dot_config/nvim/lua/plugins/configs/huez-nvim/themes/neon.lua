-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    print("neon setting")

    vim.g.neon_style = "default"
    --vim.g.neon_style = "dark"
    --vim.g.neon_style = "light"
    vim.g.neon_italic_comment = false
    vim.g.neon_italic_keyword = false
    vim.g.neon_italic_boolean = false
    vim.g.neon_italic_function = false
    vim.g.neon_italic_variable = false
    vim.g.neon_bold = false
    vim.g.neon_transparent = vim.g.transparent_enabled

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
