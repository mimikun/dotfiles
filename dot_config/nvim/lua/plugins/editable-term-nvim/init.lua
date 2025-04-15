---@type LazySpec
local spec = {
    "xb-bx/editable-term.nvim",
    --lazy = false,
    event = "VeryLazy",
    opts = require("plugins.editable-term-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
