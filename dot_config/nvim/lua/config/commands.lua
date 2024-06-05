-- Show stdpaths
vim.api.nvim_create_user_command("ShowStdPaths", function()
    print(vim.fn.stdpath("cache"))
    print(vim.fn.stdpath("config"))
    print(vim.fn.stdpath("data"))
    print(vim.fn.stdpath("state"))
end, {})

-- Toggle row number
vim.api.nvim_create_user_command("ToggleRowNumber", function()
    local number = vim.opt.number
    local number_state = number:get()
    local relativenumber = vim.opt.relativenumber
    local relativenumber_state = relativenumber:get()

    if number_state then
        number = false
        relativenumber = true
    else
        number = true
        relativenumber = false
    end
end, {})
