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
        vim.api.nvim_create_augroup("ScrollbarInit", {})
        vim.api.nvim_create_autocmd("WinScrolled", "VimResized", "QuitPre", {
            group = "ScrollbarInit",
            pattern = "* silent!",
            command = "lua require('scrollbar').show()",
        })
        vim.api.nvim_create_autocmd("WinEnter", "FocusGained", {
            group = "ScrollbarInit",
            pattern = "* silent!",
            command = "lua require('scrollbar').show()",
        })
        vim.api.nvim_create_autocmd("WinLeave", "BufLeave", "BufWinLeave", "FocusLost", {
            group = "ScrollbarInit",
            pattern = "* silent!",
            command = "lua require('scrollbar').clear()",
        })
        vim.g.scrollbar_shape = {
            head = "▲",
            body = "█",
            tail = "▼",
        }
    end,
    cond = false,
}
