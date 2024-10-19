-- NOTE: only be enabled at Home-azusa and Work-Windows
local cond = require("config.settings").use_codecompanion

---@type LazySpec
local spec = {
    "olimorris/codecompanion.nvim",
    --lazy = false,
    cmd = require("plugins.configs.codecompanion-nvim.cmds"),
    keys = require("plugins.configs.codecompanion-nvim.keys"),
    dependencies = require("plugins.configs.codecompanion-nvim.dependencies"),
    opts = require("plugins.configs.codecompanion-nvim.opts"),
    cond = cond,
    enabled = cond,
}

return spec
