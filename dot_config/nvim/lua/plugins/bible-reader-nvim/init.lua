---@type LazySpec
local spec = {
    "johnpgr/bible-reader.nvim",
    --lazy = false,
    cmd = require("plugins.bible-reader-nvim.cmds"),
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = require("plugins.bible-reader-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
