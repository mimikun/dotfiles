---@type LazySpec
local spec = {
    "one-d-wide/lazy-patcher.nvim",
    --lazy = false,
    ft = "lazy",
    opts = require("plugins.lazy-patcher-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
