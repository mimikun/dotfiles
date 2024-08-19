-- Show stdpaths
vim.api.nvim_create_user_command("ShowStdPaths", function()
    print(vim.fn.stdpath("cache"))
    print(vim.fn.stdpath("config"))
    print(vim.fn.stdpath("data"))
    print(vim.fn.stdpath("state"))
end, {})
