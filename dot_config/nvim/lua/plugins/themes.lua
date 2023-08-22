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
    {
        "tiagovla/tokyodark.nvim",
        --lazy = false,
        --priority = 1000,

        opts = {},
        config = function(_, opts)
            require("tokyodark").setup(opts) -- calling setup is optional
            vim.cmd.colorscheme("tokyodark")
        end,
        cond = false,
    },
    {
        "loctvl842/monokai-pro.nvim",
        --lazy = false,
        --priority = 1000,

        config = function()
            require("monokai-pro").setup()
            vim.cmd.colorscheme("monokai-pro")
        end,
        cond = false,
    },
    {
        "crusoexia/vim-monokai",
        --lazy = false,
        --priority = 1000,

        config = function()
            vim.cmd.colorscheme("vim-monokai")
        end,
        cond = false,
    },
    {
        "sainnhe/sonokai",
        --lazy = false,
        --priority = 1000,

        config = function()
            vim.cmd.colorscheme("sonokai")
        end,
        cond = false,
    },
    {
        "voidekh/kyotonight.vim",
        --lazy = false,
        --priority = 1000,

        config = function()
            vim.cmd.colorscheme("kyotonight")
        end,
        cond = false,
    },
    {
        "shaunsingh/nord.nvim",
        --lazy = false,
        --priority = 1000,

        config = function()
            vim.cmd.colorscheme("nord")
        end,
        cond = false,
    },
    {
        "catppuccin/nvim",
        --lazy = false,
        name = "catppuccin",
        priority = 1000,

        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
        cond = false,
    },
}
