---@type LazySpec
local spec = {
    "mcauley-penney/tidy.nvim",
    --lazy = false,
    keys = require("plugins.tidy-nvim.keys"),
    opts = require("plugins.tidy-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
