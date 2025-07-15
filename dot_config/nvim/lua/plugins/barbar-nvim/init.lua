---@type LazySpec
local spec = {
    "romgrk/barbar.nvim",
    --lazy = false,
    cmd = require("plugins.barbar-nvim.cmds"),
    keys = require("plugins.barbar-nvim.keys"),
    event = "BufEnter",
    dependencies = require("plugins.barbar-nvim.dependencies"),
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = require("plugins.barbar-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
