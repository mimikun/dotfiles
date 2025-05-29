---@type LazySpec
local spec = {
    "h598999/cs_picker",
    --lazy = false,
    cmd = require("plugins.cs_picker.cmds"),
    keys = require("plugins.cs_picker.keys"),
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = require("plugins.cs_picker.opts"),
    cond = false,
    enabled = false,
    priority = 1000,
}

return spec
