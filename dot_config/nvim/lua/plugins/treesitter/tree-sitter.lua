local global = require("config.global")

---@type table
local need_parsers = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "cpp",
    "css",
    "djot",
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
    "jsonc",
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

-- Linux or WSL
if global.is_linux or global.is_wsl then
    table.insert(need_parsers, "ocaml")
    table.insert(need_parsers, "ocaml_interface")
end

---@type table
local dependencies = {
    "windwp/nvim-ts-autotag",
    "IndianBoy42/tree-sitter-just",
    "LhKipp/nvim-nu",
    "mimikun/tree-sitter-PowerShell",
    "charmbracelet/tree-sitter-vhs",
    "RRethy/nvim-treesitter-textsubjects",
}

---@type LazySpec
local spec = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    --lazy = false,
    event = "VeryLazy",
    dependencies = dependencies,
    config = function()
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

        require("nu").setup({})
        require("nvim-ts-autotag").setup({})
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true,
                disable = {},
            },
            ensure_installed = need_parsers,
            sync_install = not global.is_human_rights,
            textsubjects = {
                enable = true,
                -- (Optional) keymap to select the previous selection
                prev_selection = ",",
                keymaps = {
                    ["."] = "textsubjects-smart",
                    [";"] = "textsubjects-container-outer",
                    ["i;"] = {
                        "textsubjects-container-inner",
                        desc = "Select inside containers (classes, functions, etc.)",
                    },
                },
            },
        })

        parser_config.powershell = {
            install_info = {
                url = "https://github.com/mimikun/tree-sitter-PowerShell",
                files = { "src/parser.c" },
                branch = "test",
            },
            filetype = { "ps1", "psd1" },
        }

        parser_config.just = {
            install_info = {
                url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
                files = { "src/parser.c", "src/scanner.cc" },
                branch = "main",
                -- use_makefile = true -- this may be necessary on MacOS (try if you see compiler errors)
            },
            filetype = { "just", "Justfile" },
            maintainers = { "@IndianBoy42" },
        }

        parser_config.vhs = {
            install_info = {
                url = "https://github.com/charmbracelet/tree-sitter-vhs",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = { "tape" },
        }
    end,
    --cond = false,
}

return spec
