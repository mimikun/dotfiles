-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    print("mellow setting")

    vim.g.mellow_italic_comments = true
    vim.g.mellow_italic_keywords = false
    vim.g.mellow_italic_booleans = false
    vim.g.mellow_italic_functions = false
    vim.g.mellow_italic_variables = false
    vim.g.mellow_bold_comments = false
    vim.g.mellow_bold_keywords = false
    vim.g.mellow_bold_booleans = false
    vim.g.mellow_bold_functions = false
    vim.g.mellow_bold_variables = false
    vim.g.mellow_transparent = vim.g.transparent_enabled

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
