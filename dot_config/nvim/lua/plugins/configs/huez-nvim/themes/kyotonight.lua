-- thx: https://github.com/cool-pants/init.lua/blob/c596b14c070dbb036f029679c48bc90550bb3237/lua/modules/themes/campfire.lua

---@type Huez.ThemeConfig
local M = {}

function M.set_theme(theme)
    print("kyotonight.vim setting")

    -- NOTE: Not support "transparent = true"
    vim.g.kyotonight_bold = 1
    vim.g.kyotonight_underline = 1
    vim.g.kyotonight_italic = 0
    vim.g.kyotonight_italic_comments = 0
    vim.g.kyotonight_uniform_status_lines = 0
    vim.g.kyotonight_bold_vertical_split_line = 0
    vim.g.kyotonight_cursor_line_number_background = 0
    vim.g.kyotonight_uniform_diff_background = 0
    vim.g.kyotonight_lualine_bold = 1

    vim.cmd("colorscheme " .. theme)
    return true
end

return M
