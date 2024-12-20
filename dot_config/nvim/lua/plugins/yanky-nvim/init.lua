---@type LazySpec
local spec = {
    "gbprod/yanky.nvim",
    --lazy = false,
    cmd = "YankyClearHistory",
    keys = require("plugins.yanky-nvim.keys"),
    dependencies = { "kkharji/sqlite.lua" },
    opts = require("plugins.yanky-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
