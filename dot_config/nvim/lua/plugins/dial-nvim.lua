---@type table
local cmds = {
    "DialIncrement",
    "DialDecrement",
}

---@type LazySpec
local spec = {
    "monaqa/dial.nvim",
    --lazy = false,
    cmd = cmds,
    keys = require("plugins.configs.dial-nvim.keys"),
    event = "VeryLazy",
    --opts = {},
    --config = true,
    --cond = false,
}

return spec
