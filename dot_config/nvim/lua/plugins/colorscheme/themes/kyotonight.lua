-- NOTE: Not support "transparent = true"
---@type LazySpec
local spec = {
    "shrikecode/kyotonight.vim",
    --lazy = false,
    init = function()
        vim.g.kyotonight_bold = 1
        vim.g.kyotonight_underline = 1
        vim.g.kyotonight_italic = 0
        vim.g.kyotonight_italic_comments = 0
        vim.g.kyotonight_uniform_status_lines = 0
        vim.g.kyotonight_bold_vertical_split_line = 0
        vim.g.kyotonight_cursor_line_number_background = 0
        vim.g.kyotonight_uniform_diff_background = 0
        vim.g.kyotonight_lualine_bold = 1
    end,
    --cond = false,
}

return spec
