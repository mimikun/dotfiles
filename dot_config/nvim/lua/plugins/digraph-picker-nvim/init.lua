---@type LazySpec
local spec = {
    "srackham/digraph-picker.nvim",
    --lazy = false,
    keys = require("plugins.digraph-picker-nvim.keys"),
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("digraph-picker").setup({})
    end,
    cond = false,
    enabled = false,
}

return spec
