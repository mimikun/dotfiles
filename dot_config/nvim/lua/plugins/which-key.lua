return {
    -- TODO: setting
    -- https://github.com/folke/which-key.nvim/blob/main/README.md
    "folke/which-key.nvim",
    --lazy = false,
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {},
    --cond = false,
}
