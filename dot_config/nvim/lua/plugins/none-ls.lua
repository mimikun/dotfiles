return {
    "nvimtools/none-ls.nvim",
    lazy = false,
    --event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local none_ls = require("null-ls")
        local sources = {
            -- Code Actions
            none_ls.builtins.code_actions.gitsigns,
            none_ls.builtins.code_actions.shellcheck,
            -- Completion
            -- Diagnostics
            none_ls.builtins.diagnostics.actionlint,
            none_ls.builtins.diagnostics.checkmake,
            none_ls.builtins.diagnostics.deno_lint,
            none_ls.builtins.diagnostics.luacheck,
            none_ls.builtins.diagnostics.markdownlint,
            none_ls.builtins.diagnostics.selene,
            none_ls.builtins.diagnostics.shellcheck,
            none_ls.builtins.diagnostics.textlint,
            none_ls.builtins.diagnostics.typos,
            none_ls.builtins.diagnostics.yamllint,
            -- Formatting
            none_ls.builtins.formatting.jq,
            none_ls.builtins.formatting.just,
            none_ls.builtins.formatting.markdownlint,
            none_ls.builtins.formatting.prettier,
            none_ls.builtins.formatting.shfmt,
            none_ls.builtins.formatting.stylua,
            none_ls.builtins.formatting.taplo,
            none_ls.builtins.formatting.textlint,
            none_ls.builtins.formatting.xmllint,
            none_ls.builtins.diagnostics.jsonlint,
            -- will use the source for all supported file types
            none_ls.builtins.formatting.deno_fmt,
            none_ls.builtins.formatting.deno_fmt.with({
                -- only runs `deno fmt` for markdown
                filetypes = { "markdown" },
            }),
            -- Hover
        }
        none_ls.setup({ sources = sources })
    end,
    --cond = false,
}
