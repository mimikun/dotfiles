---@type LazySpec
local spec = {
    "dstein64/nvim-scrollview",
    --lazy = false,
    cmd = require("plugins.nvim-scrollview.cmds"),
    opts = require("plugins.nvim-scrollview.opts"),
    cond = false,
    enabled = false,
}

return spec
