---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    --"hrsh7th/nvim-cmp",
    { "iguanacucumber/magazine.nvim", name = "nvim-cmp" },
    "nvim-telescope/telescope.nvim",
    "stevearc/dressing.nvim",
}

return dependencies
