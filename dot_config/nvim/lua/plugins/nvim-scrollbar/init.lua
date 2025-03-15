---@type LazySpec
local spec = {
    "petertriho/nvim-scrollbar",
    --lazy = false,
    event = "VimEnter",
    dependencies = require("plugins.nvim-scrollbar.dependencies"),
    opts = require("plugins.nvim-scrollbar.opts"),
    cond = false,
    enabled = false,
}

return spec
