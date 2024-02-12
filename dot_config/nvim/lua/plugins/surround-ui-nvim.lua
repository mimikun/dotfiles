return {
    "roobert/surround-ui.nvim",
    --lazy = false,
    --event = "VeryLazy",
    dependencies = {
        "kylechui/nvim-surround",
        "folke/which-key.nvim",
    },
    config = function()
        require("surround-ui").setup({
            root_key = "S",
        })
    end,
    -- TODO: enable
    cond = false,
}
