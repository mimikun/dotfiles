---@type LazySpec
local spec = {
    "kevinhwang91/nvim-bqf",
    --lazy = false,
    ft = "qf",
    cmd = require("plugins.nvim-bqf.cmds"),
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = require("plugins.nvim-bqf.opts"),
    --cond = false,
    --enabled = false,
}

return spec
