---@type LazySpec
local spec = {
    "stevearc/quicker.nvim",
    --lazy = false,
    keys = require("plugins.quicker-nvim.keys"),
    event = "FileType qf",
    opts = require("plugins.quicker-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
