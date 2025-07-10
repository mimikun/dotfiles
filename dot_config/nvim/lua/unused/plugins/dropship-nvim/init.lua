---@type LazySpec
local spec = {
    "ChausseBenjamin/dropship.nvim",
    --lazy = false,
    cmd = require("plugins.dropship-nvim.cmds"),
    keys = require("plugins.dropship-nvim.keys"),
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = require("plugins.dropship-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
