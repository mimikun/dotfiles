---@type table
local opts = {
    transparent = vim.g.transparent_enabled,
}

require("tokyonight").setup(opts)

vim.cmd.colorscheme("tokyonight")
