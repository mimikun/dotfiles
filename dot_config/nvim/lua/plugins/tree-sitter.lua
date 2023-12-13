local global = require("core.global")
local settings = require("core.settings")

local is_human_rights = global.is_human_rights
local need_parsers = settings["treesitter_parsers"]

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        --lazy = false,
        event = "VeryLazy",
        dependencies = {
            "windwp/nvim-ts-autotag",
            "IndianBoy42/tree-sitter-just",
            "LhKipp/nvim-nu",
        },
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
                sync_install = not is_human_rights,
            })

            require("nu").setup({})
        end,
        --cond = false,
    },
}
