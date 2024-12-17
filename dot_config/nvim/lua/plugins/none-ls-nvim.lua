---@type LazySpec
local spec = {
    "nvimtools/none-ls.nvim",
    --lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        --local code_actions = null_ls.builtins.code_actions
        local diagnostics = null_ls.builtins.diagnostics
        local formatting = null_ls.builtins.formatting
        local hover = null_ls.builtins.hover

        ---@type table
        local opts = {
            sources = {
                --- Code Actions
                --code_actions.gitsigns,
                --- Diagnostics
                diagnostics.fish,
                diagnostics.selene,
                --diagnostics.textlint.with({ only_local = "node_modules/.bin" }),
                diagnostics.yamllint,
                --- Formatting
                formatting.fish_indent,
                formatting.nixfmt,
                formatting.prettier.with({
                    only_local = "node_modules/.bin",
                }),
                formatting.shfmt,
                formatting.stylua,
                formatting.textlint.with({
                    only_local = "node_modules/.bin",
                }),
                --- Hover
                hover.dictionary,
                hover.printenv,
            },
        }

        null_ls.setup(opts)
    end,
    --cond = false,
    --enabled = false,
}

return spec
