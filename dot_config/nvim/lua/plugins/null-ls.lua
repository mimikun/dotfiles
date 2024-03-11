return {
    "nvimtools/none-ls.nvim",
    lazy = false,
    --event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        local code_actions = null_ls.builtins.code_actions
        local diagnostics = null_ls.builtins.diagnostics
        local formatting = null_ls.builtins.formatting
        --local completion = null_ls.builtins.completion
        --local hover = null_ls.builtins.hover

        local sources = {
            -- Code Actions
            code_actions.gitsigns,
            -- Completion
            --completion.NAME
            -- Diagnostics
            diagnostics.actionlint,
            diagnostics.checkmake,
            diagnostics.selene,
            -- Formatting
            formatting.just,
            formatting.shfmt,
            formatting.stylua,
            -- Hover
            -- hover.NAME
            -- TODO: Fix checkhealth error
            --[[
            --diagnostics.markdownlint,
            --diagnostics.textlint,
            --diagnostics.yamllint,
            --formatting.textlint,
            --formatting.markdownlint,
            --formatting.prettier,
            ]]
        }
        null_ls.setup({ sources = sources })
    end,
    -- TODO: settings
    --cond = false,
}
