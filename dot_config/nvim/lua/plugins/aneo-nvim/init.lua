---@type LazySpec
local spec = {
    "amanbabuhemant/aneo.nvim",
    --lazy = false,
    cmd = require("plugins.aneo-nvim.cmds"),
    opts = require("plugins.aneo-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
