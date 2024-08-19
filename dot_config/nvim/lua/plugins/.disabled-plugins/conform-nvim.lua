---@type LazySpec
local spec = {
    "stevearc/conform.nvim",
    lazy = false,
    cmd = "ConformInfo",
    --event = "VeryLazy",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                xml = { "xmllint" },
                yaml = { "yamlfmt" },
                bash = { "shfmt" },
                zsh = { "shfmt" },
                php = { "php_cs_fixer" },
                markdown = { "markdownlint" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                cmake = { "cmake_format" },
                lua = { "stylua" },
                go = { "goimports", "gofmt" },
                python = { "isort", "black" },
                javascript = { "biome", "prettier" },
                typescript = { "biome", "prettier" },
                fish = { "fish_indent" },
                ["*"] = { "typos", "textlint" },
                ["_"] = { "trim_whitespace" },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
            notify_on_error = true,
            notify_no_formatters = true,
        })
    end,
    --cond = false,
    -- NOTE: null-ls replace plugin `pattern 1`
    enabled = false,
}

return spec
