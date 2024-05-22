vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = vim.api.nvim_create_augroup("SetDjotFiletype", { clear = true }),
    pattern = { "*.dj" },
    callback = function()
        vim.cmd([[set filetype=djot]])
    end,
})
