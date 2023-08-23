-- User functions
vim.api.nvim_create_user_command(
    "Vup",
    function()
        vim.cmd(":Lazy update")
        vim.cmd(":Lazy restore")
        vim.cmd(":Lazy sync")
        vim.cmd(":TSUpdate")
        vim.cmd(":CocUpdate")
    end,
    {}
)
