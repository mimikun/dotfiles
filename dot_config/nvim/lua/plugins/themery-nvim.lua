local themery_config = require("core.global").themery_config

return {
    "zaldih/themery.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = "Themery",
    config = function()
        require("themery").setup({
            themes = {
                {
                    name = "github-nvim-theme",
                    colorscheme = "github_dark",
                },
                {
                    name = "momiji",
                    colorscheme = "momiji",
                },
                {
                    name = "monokai-pro.nvim",
                    colorscheme = "monokai-pro",
                },
                {
                    name = "monokai.nvim",
                    colorscheme = "monokai",
                },
                {
                    name = "nightfox.nvim",
                    colorscheme = "nightfox",
                },
                {
                    name = "nord.nvim",
                    colorscheme = "nord",
                },
                {
                    name = "penumbra.nvim",
                    colorscheme = "penumbra",
                },
                {
                    name = "sonokai",
                    colorscheme = "sonokai",
                },
                {
                    name = "tokyodark.nvim",
                    colorscheme = "tokyodark",
                },
                {
                    name = "tokyonight.nvim",
                    colorscheme = "tokyonight",
                },
                {
                    name = "yash.nvim",
                    colorscheme = "yash",
                },
                {
                    name = "catppuccin",
                    colorscheme = "catppuccin",
                },
                {
                    name = "edge",
                    colorscheme = "edge",
                },
                {
                    name = "kyotonight.vim",
                    colorscheme = "kyotonight",
                },
            },
            themeConfigFile = themery_config,
            livePreview = true,
        })
    end,
    --cond = false,
}
