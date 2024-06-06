local global = require("config.global")

---@type LazySpec
local spec = {
    "nvimtools/none-ls.nvim",
    lazy = false,
    --event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- TODO: settings
    config = function()
        local null_ls = require("null-ls")

        local code_actions = null_ls.builtins.code_actions
        local completion = null_ls.builtins.completion
        local diagnostics = null_ls.builtins.diagnostics
        local formatting = null_ls.builtins.formatting
        local hover = null_ls.builtins.hover

        ---@type table
        local need_sources = {
            linux = {
                -- Code Actions
                code_actions.gitsigns,
                -- Diagnostics
                diagnostics.actionlint,
                diagnostics.checkmake,
                diagnostics.commitlint,
                diagnostics.editorconfig_checker.with({
                    command = "ec",
                }),
                diagnostics.fish,
                diagnostics.hadolint,
                diagnostics.markdownlint,
                diagnostics.phpcs,
                diagnostics.selene,
                diagnostics.textlint,
                diagnostics.yamllint,
                diagnostics.zsh,
                -- Formatting
                formatting.fish_indent,
                formatting.just,
                formatting.markdownlint,
                formatting.phpcsfixer,
                formatting.prettier,
                formatting.shfmt,
                formatting.stylua,
                formatting.textlint,
                formatting.yamlfmt,
                -- Hover
                hover.dictionary,
                hover.printenv,
            },
            windows = {
                -- Code Actions
                code_actions.gitsigns,
                -- Diagnostics
                diagnostics.commitlint,
                diagnostics.editorconfig_checker,
                diagnostics.markdownlint,
                diagnostics.phpcs,
                diagnostics.selene,
                diagnostics.textlint,
                diagnostics.yamllint,
                -- Formatting
                formatting.markdownlint,
                formatting.phpcsfixer,
                formatting.prettier,
                formatting.stylua,
                formatting.textlint,
                formatting.yamlfmt,
                -- Hover
                hover.dictionary,
                hover.printenv,
            },
        }

        local sources = global.is_windows and need_sources.windows or need_sources.linux

        null_ls.setup({ sources = sources })
    end,
    --cond = false,
}

return spec
