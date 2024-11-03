---@type table
local opts = {}

require("treesj").setup(opts)

vim.keymap.set("n", "<leader>m", function()
    require("treesj").toggle()
end, {})
vim.keymap.set("n", "<leader>j", function()
    require("treesj").join()
end, {})
vim.keymap.set("n", "<leader>s", function()
    require("treesj").split()
end, {})
