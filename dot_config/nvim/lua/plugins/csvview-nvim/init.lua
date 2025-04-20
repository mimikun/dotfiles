---@type LazySpec
local spec = {
    "hat0uma/csvview.nvim",
    --lazy = false,
    cmd = require("plugins.csvview-nvim.cmds"),
    opts = require("plugins.csvview-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
