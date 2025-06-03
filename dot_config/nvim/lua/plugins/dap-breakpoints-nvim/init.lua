---@type LazySpec
local spec = {
    "Carcuis/dap-breakpoints.nvim",
    --lazy = false,
    cmd = require("plugins.dap-breakpoints-nvim.cmds"),
    keys = require("plugins.dap-breakpoints-nvim.keys"),
    event = "VeryLazy",
    dependencies = require("plugins.dap-breakpoints-nvim.dependencies"),
    opts = require("plugins.dap-breakpoints-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
