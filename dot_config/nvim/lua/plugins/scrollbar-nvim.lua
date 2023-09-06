return {
    "Xuyuanp/scrollbar.nvim",
    --lazy = false,
    event = {
        "WinScrolled",
        "VimResized",
        "QuitPre",
        "WinEnter",
        "FocusGained",
    },
    config = function()
        -- TODO: refactor using lua
        vim.cmd([[
            augroup ScrollbarInit
                autocmd!
                autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
                autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
                autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
            augroup end
        ]])
        vim.g.scrollbar_shape = {
            head = "▲",
            body = "█",
            tail = "▼",
        }
    end,
    cond = false,
}
