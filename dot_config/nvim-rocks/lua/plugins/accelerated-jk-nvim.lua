---@type table
local opts = {}

require("accelerated-jk").setup(opts)

vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", {})
vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", {})
