---@type LazySpec
local spec = {
    "shortcuts/no-neck-pain.nvim",
    --lazy = false,
    cmd = require("plugins.no-neck-pain-nvim.cmds"),
    dependencies = require("plugins.no-neck-pain-nvim.dependencies"),
    opts = require("plugins.no-neck-pain-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
