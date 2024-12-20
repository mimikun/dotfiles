---@type table
local cmds = {
    "TSJToggle",
    "TSJSplit",
    "TSJoin",
}

---@type LazySpec
local spec = {
    "Wansmer/treesj",
    --lazy = false,
    cmd = cmds,
    keys = require("plugins.treesj.keys"),
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec
