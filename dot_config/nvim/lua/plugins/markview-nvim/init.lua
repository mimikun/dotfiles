---@type LazySpec
local spec = {
    "OXY2DEV/markview.nvim",
    --branch = "dev",
    --lazy = false,
    ft = "markdown",
    cmd = "Markview",
    event = "BufEnter",
    dependencies = require("plugins.markview-nvim.dependencies"),
    opts = require("plugins.markview-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
