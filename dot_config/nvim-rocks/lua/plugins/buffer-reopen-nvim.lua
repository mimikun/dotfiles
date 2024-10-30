---@type table
local opts = {}

require("buffer-reopen").setup(opts)

vim.keymap.set("n", "<leader>bt", ":BufferHistory reopen<CR>", { silent = true })
vim.keymap.set("n", "<C-S-t>", ":BufferHistory reopen<CR>", { silent = true })
