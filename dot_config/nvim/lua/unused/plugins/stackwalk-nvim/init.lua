---@type LazySpec
local spec = {
    "pathmann/stackwalk.nvim",
    --lazy = false,
    ft = "dmp",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require("plugins.stackwalk-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
