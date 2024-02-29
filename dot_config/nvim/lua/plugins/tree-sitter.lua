local global = require("core.global")
local settings = require("core.settings")

---@type boolean
local is_human_rights = global.is_human_rights
---@type table
local treesitter_parsers = settings["treesitter_parsers"]

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    --lazy = false,
    event = "VeryLazy",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "IndianBoy42/tree-sitter-just",
        "LhKipp/nvim-nu",
        "Fymyte/tree-sitter-rasi",
        "mimikun/tree-sitter-PowerShell",
        { "nvim-orgmode/orgmode", build = ":TSInstall! org" },
        -- NOTE: has bug
        --{ "apple/pkl-neovim", build = ":TSInstall! pkl" },
    },
    config = function()
        local configs = require("nvim-treesitter.configs")
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

        local nvim_nu = require("nu")
        local nvim_ts_autotag = require("nvim-ts-autotag")
        local orgmode = require("orgmode")

        nvim_nu.setup({})
        nvim_ts_autotag.setup({})
        orgmode.setup_ts_grammar()

        local need_parsers = treesitter_parsers
        table.insert(need_parsers, "org")
        --table.insert(need_parsers, "pkl")

        configs.setup({
            highlight = {
                enable = true,
                disable = {},
            },
            ensure_installed = need_parsers,
            sync_install = not is_human_rights,
        })

        parser_config.powershell = {
            install_info = {
                url = "https://github.com/mimikun/tree-sitter-PowerShell",
                files = { "src/parser.c" },
                branch = "test",
            },
            filetype = { "ps1", "psd1" },
        }

        parser_config.rasi = {
            install_info = {
                url = "https://github.com/Fymyte/tree-sitter-rasi",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = { "rasi" },
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
    end,
    --cond = false,
}
