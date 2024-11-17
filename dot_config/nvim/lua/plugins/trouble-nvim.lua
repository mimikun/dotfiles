---@type LazySpec
local spec = {
    "folke/trouble.nvim",
    --lazy = false,
    cmd = "Trouble",
    keys = require("plugins.configs.trouble-nvim.keys"),
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("plugins.configs.trouble-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
