return {
    "petertriho/nvim-scrollbar",
    lazy = false,
    --event = "VeryLazy",
    dependencies = {
        "kevinhwang91/nvim-hlslens",
        "lewis6991/gitsigns.nvim",
    },
    config = function()
        require("scrollbar").setup({})
        require("scrollbar.handlers.search").setup({})
        require("scrollbar.handlers.gitsigns").setup({})
    end,
    --cond = false,
}
