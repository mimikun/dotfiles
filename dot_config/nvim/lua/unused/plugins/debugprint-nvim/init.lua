---@type LazySpec
local spec = {
    "andrewferrier/debugprint.nvim",
    -- NOTE: Required to make line highlighting work before debugprint is first used
    lazy = false,
    cmd = require("plugins.debugprint-nvim.cmds"),
    keys = require("plugins.debugprint-nvim.keys"),
    dependencies = { "echasnovski/mini.nvim" },
    opts = require("plugins.debugprint-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
