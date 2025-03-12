---@type LazySpec
local spec = {
    "chentoast/marks.nvim",
    --lazy = false,
    cmd = require("plugins.marks-nvim.cmds"),
    event = "VeryLazy",
    opts = require("plugins.marks-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
