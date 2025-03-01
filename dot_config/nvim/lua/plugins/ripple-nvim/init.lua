---@type LazySpec
local spec = {
    "ian-howell/ripple.nvim",
    --lazy = false,
    keys = require("plugins.ripple-nvim.keys"),
    opts = require("plugins.ripple-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
