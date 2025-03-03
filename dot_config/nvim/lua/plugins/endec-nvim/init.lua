---@type LazySpec
local spec = {
    "ovk/endec.nvim",
    --lazy = false,
    event = "VeryLazy",
    opts = require("plugins.endec-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
