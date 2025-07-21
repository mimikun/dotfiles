---@type LazySpec
local spec = {
    "mrshmllow/orgmode-babel.nvim",
    --lazy = false,
    ft = "org",
    cmd = require("plugins.orgmode-babel-nvim.cmds"),
    dependencies = require("plugins.orgmode-babel-nvim.dependencies"),
    opts = require("plugins.orgmode-babel-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
