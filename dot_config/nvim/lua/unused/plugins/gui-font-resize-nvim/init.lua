---@type LazySpec
local spec = {
    "ktunprasert/gui-font-resize.nvim",
    --lazy = false,
    cmd = require("plugins.gui-font-resize-nvim.cmds"),
    keys = require("plugins.gui-font-resize-nvim.keys"),
    opts = require("plugins.gui-font-resize-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
