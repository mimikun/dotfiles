return {
    "kylechui/nvim-surround",
    version = "*",
    --lazy = false,
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
    end,
    cond = false,
}
