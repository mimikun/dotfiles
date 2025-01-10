---@type LazySpec
local spec = {
    "vague2k/huez.nvim",
    import = "huez-manager.import",
    branch = "stable",
    --lazy = false,
    event = "UIEnter",
    dependencies = require("plugins.huez-nvim.dependencies"),
    cmd = require("plugins.huez-nvim.cmds"),
    opts = require("plugins.huez-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
