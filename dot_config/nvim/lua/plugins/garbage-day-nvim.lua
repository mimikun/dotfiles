---@type LazySpec
local spec = {
    "zeioth/garbage-day.nvim",
    --lazy = false,
    event = "VeryLazy",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {},
    --cond = false,
}

return spec
