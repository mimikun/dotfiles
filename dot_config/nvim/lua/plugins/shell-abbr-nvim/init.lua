---@type LazySpec
local spec = {
    "reyalka/shell-abbr.nvim",
    --lazy = false,
    ft = require("plugins.shell-abbr-nvim.ft"),
    opts = require("plugins.shell-abbr-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
