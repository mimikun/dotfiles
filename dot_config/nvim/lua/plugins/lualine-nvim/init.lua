---@type LazySpec
local spec = {
    "nvim-lualine/lualine.nvim",
    --lazy = false,
    event = "BufEnter",
    dependencies = require("plugins.lualine-nvim.dependencies"),
    opts = require("plugins.lualine-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
