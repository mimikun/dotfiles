-- TODO: config it

---@type LazySpec
local spec = {
    "olimorris/codecompanion.nvim",
    --lazy = false,
    cmd = require("plugins.configs.codecompanion-nvim.cmds"),
    keys = require("plugins.configs.codecompanion-nvim.keys"),
    dependencies = require("plugins.configs.codecompanion-nvim.dependencies"),
    opts = require("plugins.configs.codecompanion-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
