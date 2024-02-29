return {
    "nvimtools/none-ls.nvim",
    lazy = false,
    --event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        local sources = {
            -- Code Actions
            null_ls.builtins.code_actions.gitsigns,
            -- Completion
            -- Diagnostics
            null_ls.builtins.diagnostics.actionlint,
            null_ls.builtins.diagnostics.checkmake,
            null_ls.builtins.diagnostics.markdownlint,
            null_ls.builtins.diagnostics.selene,
            null_ls.builtins.diagnostics.textlint,
            null_ls.builtins.diagnostics.yamllint,
            -- Formatting
            null_ls.builtins.formatting.just,
            null_ls.builtins.formatting.markdownlint,
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.shfmt,
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.textlint,
            -- Hover
        }
        null_ls.setup({ sources = sources })
    end,
    -- TODO: settings
    cond = false,
}
