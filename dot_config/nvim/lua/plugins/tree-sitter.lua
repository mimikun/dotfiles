local need_parsers = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "cpp",
    "css",
    "dockerfile",
    "fish",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "gowork",
    "graphql",
    "html",
    "ini",
    "java",
    "javascript",
    "jq",
    "jsdoc",
    "json",
    "json5",
    "kdl",
    "latex",
    "lua",
    "luadoc",
    "luap",
    "luau",
    "make",
    "markdown",
    "markdown_inline",
    "ninja",
    "nix",
    "ocaml",
    "ocaml_interface",
    "python",
    "regex",
    "rst",
    "ruby",
    "rust",
    "scala",
    "scss",
    "sql",
    "svelte",
    "swift",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
    "yaml",
    "zig",
}

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
