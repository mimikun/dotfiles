---@type LazySpec
local spec = {
    "dawsers/snacks-picker-firefox.nvim",
    --lazy = false,
    keys = require("plugins.snacks-picker-firefox-nvim.keys"),
    dependencies = require("plugins.snacks-picker-firefox-nvim.dependencies"),
    opts = require("plugins.snacks-picker-firefox-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
