---@type LazySpec
local spec = {
    "alex-popov-tech/store.nvim",
    --lazy = false,
    cmd = "Store",
    keys = require("plugins.store-nvim.keys"),
    dependencies = { "OXY2DEV/markview.nvim" },
    opts = require("plugins.store-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
