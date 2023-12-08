local settings = require("core.settings")
local need_parsers = settings["treesitter_parsers"]

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        --lazy = false,
        event = "VeryLazy",
        config = function()
            -- TODO:setting
            -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins
            -- "LhKipp/nvim-nu"
            -- "IndianBoy42/tree-sitter-just"
            -- "windwp/nvim-ts-autotag"
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                highlight = {
                    enable = true,
                    disable = {},
                },
                ensure_installed = need_parsers,
            })
        end,
        --cond = false,
    },
    {
        "windwp/nvim-ts-autotag",
        --lazy = false,
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        cond = false,
    },
    {
        "IndianBoy42/tree-sitter-just",
        --lazy = false,
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        --cond = false,
    },
    {
        "LhKipp/nvim-nu",
        build = ":TSInstall nu",
        --lazy = false,
        event = "VeryLazy",
        ft = "nu",
        config = function()
            require("nu").setup({})
        end,
        cond = false,
    },
}
