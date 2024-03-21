---@type LazySpec
local spec = {
    "zeioth/garbage-day.nvim",
    --lazy = false,
    event = "VeryLazy",
    dependencies = { "neovim/nvim-lspconfig" },
    config = true,
    --cond = false,
}

return spec
