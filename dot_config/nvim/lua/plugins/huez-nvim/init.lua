---@type table
local cmds = {
    "Huez",
    "HuezEnsured",
    "HuezLive",
    "HuezFavorites",
}

---@type LazySpec
local spec = {
    "vague2k/huez.nvim",
    import = "huez-manager.import",
    branch = "stable",
    --lazy = false,
    event = "UIEnter",
    dependencies = require("plugins.huez-nvim.dependencies"),
    cmd = cmds,
    opts = require("plugins.huez-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
