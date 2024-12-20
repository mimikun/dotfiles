---@type LazySpec
local spec = {
    "sphamba/smear-cursor.nvim",
    --lazy = false,
    cmd = "SmearCursorToggle",
    event = "VimEnter",
    opts = require("plugins.smear-cursor-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
