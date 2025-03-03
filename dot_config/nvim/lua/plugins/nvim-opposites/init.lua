---@type LazySpec
local spec = {
    "tigion/nvim-opposites",
    --lazy = false,
    keys = require("plugins.nvim-opposites.keys"),
    event = { "BufReadPost", "BufNewFile" },
    opts = require("plugins.nvim-opposites.opts"),
    cond = false,
    enabled = false,
}

return spec
