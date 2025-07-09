---@type LazySpec
local spec = {
    "zhisme/copy_with_context.nvim",
    --lazy = false,
    keys = require("plugins.copy-with-context-nvim.keys"),
    opts = require("plugins.copy-with-context-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
