---@type LazySpec
local spec = {
    "jghauser/papis.nvim",
    --lazy = false,
    ft = require("plugins.papis-nvim.ft"),
    cmd = "Papis",
    dependencies = require("plugins.papis-nvim.dependencies"),
    opts = require("plugins.papis-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
