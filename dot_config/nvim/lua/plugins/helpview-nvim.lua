---@type LazySpec
local spec = {
    "OXY2DEV/helpview.nvim",
    -- NOTE: helpview.nvim is DO NOT lazy loading
    --lazy = false,
    ft = "help",
    cmd = "Helpview",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = require("plugins.configs.helpview-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
