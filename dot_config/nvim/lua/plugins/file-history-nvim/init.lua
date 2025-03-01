---@type LazySpec
local spec = {
    "dawsers/file-history.nvim",
    --lazy = false,
    cmd = "FileHistory",
    keys = require("plugins.file-history.keys"),
    dependencies = { "folke/snacks.nvim" },
    opts = require("plugins.file-history.opts"),
    cond = false,
    enabled = false,
}

return spec
