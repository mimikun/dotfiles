---@type LazySpec
local spec = {
    "svampkorg/moody.nvim",
    --lazy = false,
    event = require("plugins.moody-nvim.events"),
    opts = require("plugins.moody-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
