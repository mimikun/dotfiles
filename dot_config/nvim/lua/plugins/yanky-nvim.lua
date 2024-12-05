---@type LazySpec
local spec = {
    "gbprod/yanky.nvim",
    --lazy = false,
    cmd = "YankyClearHistory",
    keys = require("plugins.configs.yanky-nvim.keys"),
    dependencies = { "kkharji/sqlite.lua" },
    opts = require("plugins.configs.yanky-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
