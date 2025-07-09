---@type LazySpec
local spec = {
    "S1M0N38/ctx.nvim",
    version = "*",
    --lazy = false,
    keys = require("plugins.ctx-nvim.keys"),
    opts = require("plugins.ctx-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
