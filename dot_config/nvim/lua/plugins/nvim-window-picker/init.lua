---@type LazySpec
local spec = {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    version = "2.*",
    --lazy = false,
    event = "VeryLazy",
    opts = require("plugins.nvim-window-picker.opts"),
    cond = false,
    enabled = false,
}

return spec
