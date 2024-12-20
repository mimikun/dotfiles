---@type LazySpec[]
local dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
}

---@type LazySpec
local spec = {
    "nvimdev/lspsaga.nvim",
    --lazy = false,
    cmd = "Lspsaga",
    event = "LspAttach",
    dependencies = dependencies,
    opts = require("plugins.lspsaga-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
