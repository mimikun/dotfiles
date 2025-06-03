---@type LazySpec
local spec = {
    "Weissle/persistent-breakpoints.nvim",
    --lazy = false,
    cmd = require("plugins.persistent-breakpoints-nvim.cmds"),
    --event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap" },
    opts = require("plugins.persistent-breakpoints-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
