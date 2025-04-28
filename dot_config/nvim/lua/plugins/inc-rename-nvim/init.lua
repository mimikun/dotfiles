---@type LazySpec
local spec = {
    "smjonas/inc-rename.nvim",
    --lazy = false,
    cmd = "IncRename",
    keys = require("plugins.inc-rename-nvim.keys"),
    opts = require("plugins.inc-rename-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
