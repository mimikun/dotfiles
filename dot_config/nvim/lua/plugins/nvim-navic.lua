---@type LazySpec
local spec = {
    "SmiteshP/nvim-navic",
    --lazy = false,
    dependencies = { "neovim/nvim-lspconfig" },
    opts = require("plugins.configs.nvim-navic.opts"),
    --cond = false,
    --enabled = false,
}

return spec
