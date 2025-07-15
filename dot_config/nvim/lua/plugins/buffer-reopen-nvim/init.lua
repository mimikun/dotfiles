---@type LazySpec
local spec = {
    "iamyoki/buffer-reopen.nvim",
    --lazy = false,
    cmd = "BufferHistory",
    keys = require("plugins.buffer-reopen-nvim.keys"),
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec
