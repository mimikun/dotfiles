---@type LazySpec
local spec = {
    "vzze/cmdline.nvim",
    --lazy = false,
    keys = { "/" },
    opts = require("plugins.cmdline-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
