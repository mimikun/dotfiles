---@type LazySpec
local spec = {
    "philosofonusus/ecolog.nvim",
    lazy = false,
    cmd = require("plugins.ecolog-nvim.cmds"),
    dependencies = require("plugins.ecolog-nvim.dependencies"),
    opts = require("plugins.ecolog-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
