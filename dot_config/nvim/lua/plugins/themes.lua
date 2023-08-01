return {
    {
        "projekt0n/github-nvim-theme",
        lazy = false,
        priority = 1000,

        config = function()
            require("github-theme").setup({})
            vim.cmd.colorscheme("github_dark")
        end,
        --cond = false,
    },
    {
        "tanvirtin/monokai.nvim",
        --lazy = false,
        --priority = 1000,

        config = function()
            require("monokai").setup({})
            vim.cmd.colorscheme("monokai")
        end,
        cond = false,
    },
    {
        "Allianaab2m/penumbra.nvim",
        --lazy = false,
        --priority = 1000,

        config = function()
            require("penumbra").setup({})
            vim.cmd.colorscheme("penumbra")
        end,
        cond = false,
    },
    {
        "folke/tokyonight.nvim",
        --lazy = false,
        --priority = 1000,

        config = function()
            vim.cmd.colorscheme("tokyonight")
        end,
        cond = false,
    },
    {
        "kihachi2000/yash.nvim",
        --lazy = false,
        --priority = 1000,

        config = function()
            vim.cmd.colorscheme("yash")
        end,
        cond = false,
    },
    {
        "EdenEast/nightfox.nvim",
        --lazy = false,
        --priority = 1000,

        config = function()
            vim.cmd.colorscheme("nightfox")
        end,
        cond = false,
    },
}
