-- nvim-scrollbar alternative plugins
return {
    "Xuyuanp/scrollbar.nvim",
    lazy = false,
    --event = "VeryLazy",
    --dependencies = {},
    config = function()
        -- TODO: Use augroup autocmd
        vim.cmd([[
        augroup ScrollbarInit
            autocmd!
            autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
            autocmd WinEnter,FocusGained * silent! lua require('scrollbar').show()
            autocmd WinLeave,BufLeave,BufWinLeave,FocusLost * silent! lua require('scrollbar').clear()
        augroup end
        ]])
        vim.g.scrollbar_max_size = 10
        vim.g.scrollbar_min_size = 3
        vim.g.scrollbar_right_offset = 1
        vim.g.scrollbar_shape = {
            head = "▲",
            body = "█",
            tail = "▼",
        }
        vim.g.scrollbar_highlight = {
            head = "Normal",
            body = "Normal",
            tail = "Normal",
        }
        vim.g.scrollbar_excluded_filetypes = { "nerdtree", "tagbar" }
        -- scrollbar_width 1 is not shown
        vim.g.scrollbar_width = 2
        vim.g.scrollbar_winblend = 0
    end,
    cond = false,
}
