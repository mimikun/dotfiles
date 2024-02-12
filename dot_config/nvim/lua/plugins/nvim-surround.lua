return {
    "kylechui/nvim-surround",
    version = "*",
    --lazy = false,
    event = "VeryLazy",
    config = function()
        -- TODO: setting
        -- https://github.com/kylechui/nvim-surround/blob/main/README.md
        require("nvim-surround").setup({})
    end,
    cond = false,
}
