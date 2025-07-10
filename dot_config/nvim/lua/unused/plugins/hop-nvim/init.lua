---@type table
local opts = {
    keys = "asdghklqwertyuiopzxcvbnmfj",
    quit_key = "<Esc>",
}

---@type LazySpec
local spec = {
    "smoka7/hop.nvim",
    version = "*",
    --lazy = false,
    keys = require("plugins.hop-nvim.keys"),
    cmd = require("plugins.hop-nvim.cmds"),
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
