---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
    "SmiteshP/nvim-navic",
    "pnx/lualine-lsp-status",
}

---@type LazySpec
local spec = {
    "nvim-lualine/lualine.nvim",
    --lazy = false,
    event = "BufEnter",
    dependencies = dependencies,
    opts = require("plugins.lualine-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
