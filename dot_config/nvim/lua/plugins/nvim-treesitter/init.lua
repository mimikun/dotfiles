---@type LazySpec[]
local dependencies = {
    "windwp/nvim-ts-autotag",
    "RRethy/nvim-treesitter-textsubjects",
}

---@type LazySpec
local spec = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    --lazy = false,
    event = "VeryLazy",
    dependencies = dependencies,
    config = function()
        require("nvim-ts-autotag").setup({})
        require("nvim-treesitter.configs").setup(require("plugins.nvim-treesitter.opts"))
    end,
    --cond = false,
    --enabled = false,
}

return spec
