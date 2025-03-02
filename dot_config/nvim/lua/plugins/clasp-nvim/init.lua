---@type LazySpec
local spec = {
    "xzbdmw/clasp.nvim",
    --lazy = false,
    keys = require("plugins.clasp-nvim.keys"),
    opts = require("plugins.clasp-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
