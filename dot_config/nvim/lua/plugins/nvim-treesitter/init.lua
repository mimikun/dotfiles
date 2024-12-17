---@type LazySpec[]
local dependencies = {
    "windwp/nvim-ts-autotag",
    "RRethy/nvim-treesitter-textsubjects",
}

---@type table
local opts = require("plugins.nvim-treesitter.opts")

---@type LazySpec
local spec = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    --lazy = false,
    event = "VeryLazy",
    dependencies = dependencies,
    config = function()
        require("nvim-ts-autotag").setup({})
        require("nvim-treesitter.configs").setup(opts)
    end,
    --cond = false,
    --enabled = false,
}

return spec
