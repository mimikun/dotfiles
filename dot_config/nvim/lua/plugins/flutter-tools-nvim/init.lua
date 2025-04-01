-- NOTE: DO NOT configure `dartls`

---@type LazySpec
local spec = {
    "nvim-flutter/flutter-tools.nvim",
    --lazy = false,
    cmd = require("plugins.flutter-tools-nvim.cmds"),
    event = "BufEnter",
    dependencies = require("plugins.flutter-tools-nvim.dependencies"),
    opts = require("plugins.flutter-tools-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
