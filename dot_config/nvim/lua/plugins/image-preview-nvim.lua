return {
    "adelarsq/image_preview.nvim",
    --lazy = false,
    event = "VeryLazy",
    config = function()
        require("image_preview").setup({})
    end,
    cond = false,
}
