---@type LazySpec
local spec = {
    "wsdjeg/scrollbar.nvim",
    --lazy = false,
    event = "VimEnter",
    opts = require("plugins.scrollbar-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
