-- aiscript: https://github.com/aiscript-dev/aiscript
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = vim.api.nvim_create_augroup("SetAiscriptFiletype", { clear = true }),
    pattern = { "*.is", "*ais" },
    callback = function()
        vim.cmd([[set filetype=aiscript]])
    end,
})
