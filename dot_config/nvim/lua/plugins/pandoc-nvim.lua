return {
    "aspeddro/pandoc.nvim",
    --lazy = false,
    --event = "VeryLazy",
    config = function()
        require("pandoc").setup({})
    end,
    --cond = false,
}
