-- NOTE: only be enabled at Home-azusa and Work-Windows
---@type boolean
local cond = require("config.settings").use_codecompanion

---@type LazySpec
local spec = {
    "olimorris/codecompanion.nvim",
    --lazy = false,
    cmd = require("plugins.codecompanion-nvim.cmds"),
    keys = require("plugins.codecompanion-nvim.keys"),
    dependencies = require("plugins.codecompanion-nvim.dependencies"),
    opts = require("plugins.codecompanion-nvim.opts"),
    cond = cond,
    enabled = cond,
}

return spec
