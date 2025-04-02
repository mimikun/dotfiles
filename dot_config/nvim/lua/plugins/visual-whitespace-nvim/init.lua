---@type LazySpec
local spec = {
    "mcauley-penney/visual-whitespace.nvim",
    --lazy = false,
    keys = require("plugins.visual-whitespace-nvim.keys"),
    opts = require("plugins.visual-whitespace-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
