local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover

---@type table[]
local M = {
    windows = {
        -- Code Actions
        code_actions.gitsigns,
        -- Diagnostics
        diagnostics.actionlint,
        diagnostics.cmake_lint,
        diagnostics.commitlint,
        diagnostics.editorconfig_checker,
        diagnostics.golangci_lint,
        diagnostics.hadolint,
        diagnostics.markdownlint,
        diagnostics.mypy,
        diagnostics.phpcs,
        diagnostics.pylint,
        diagnostics.selene,
        diagnostics.textlint,
        diagnostics.todo_comments,
        diagnostics.trail_space,
        diagnostics.yamllint,
        -- Formatting
        formatting.biome,
        formatting.black,
        formatting.clang_format,
        formatting.cmake_format,
        formatting.gofmt,
        formatting.isort,
        formatting.just,
        formatting.markdownlint,
        formatting.phpcsfixer,
        formatting.prettier,
        formatting.stylua,
        formatting.textlint,
        formatting.xmllint,
        formatting.yamlfmt,
        -- Hover
        hover.dictionary,
        hover.printenv,
    },
    linux = {
        -- Code Actions
        code_actions.gitsigns,
        -- Diagnostics
        diagnostics.actionlint,
        diagnostics.checkmake,
        diagnostics.cmake_lint,
        diagnostics.commitlint,
        diagnostics.editorconfig_checker,
        diagnostics.fish,
        diagnostics.golangci_lint,
        diagnostics.hadolint,
        diagnostics.markdownlint,
        diagnostics.mypy,
        diagnostics.phpcs,
        diagnostics.pylint,
        diagnostics.selene,
        diagnostics.textlint,
        diagnostics.todo_comments,
        diagnostics.trail_space,
        diagnostics.yamllint,
        diagnostics.zsh,
        -- Formatting
        formatting.biome,
        formatting.black,
        formatting.clang_format,
        formatting.cmake_format,
        formatting.fish_indent,
        formatting.gofmt,
        formatting.isort,
        formatting.just,
        formatting.markdownlint,
        formatting.phpcsfixer,
        formatting.prettier,
        formatting.shfmt,
        formatting.stylua,
        formatting.textlint,
        formatting.xmllint,
        formatting.yamlfmt,
        -- Hover
        hover.dictionary,
        hover.printenv,
    },
    minimal = {
        --- Code Actions
        --code_actions.gitsigns,
        --- Diagnostics
        diagnostics.fish,
        diagnostics.selene,
        --diagnostics.textlint.with({ only_local = "node_modules/.bin" }),
        diagnostics.yamllint,
        --- Formatting
        formatting.fish_indent,
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
    full = {
        --- Code Actions
        code_actions.gitsigns,
        --- Diagnostics
        diagnostics.actionlint,
        diagnostics.checkmake,
        diagnostics.cmake_lint,
        diagnostics.commitlint.with({
            only_local = "node_modules/.bin",
        }),
        diagnostics.editorconfig_checker.with({
            command = "ec",
        }),
        diagnostics.fish,
        diagnostics.golangci_lint,
        diagnostics.hadolint,
        diagnostics.markdownlint,
        diagnostics.mypy,
        diagnostics.phpcs,
        diagnostics.pylint,
        diagnostics.selene,
        diagnostics.textlint.with({
            only_local = "node_modules/.bin",
        }),
        diagnostics.todo_comments,
        diagnostics.trail_space,
        diagnostics.yamllint,
        diagnostics.zsh,
        --- Formatting
        formatting.biome,
        formatting.black,
        formatting.clang_format,
        formatting.cmake_format,
        formatting.fish_indent,
        formatting.gofmt,
        formatting.isort,
        formatting.just,
        formatting.markdownlint,
        formatting.phpcsfixer,
        formatting.prettier.with({
            only_local = "node_modules/.bin",
        }),
        formatting.shfmt,
        formatting.stylua,
        formatting.textlint.with({
            only_local = "node_modules/.bin",
        }),
        formatting.xmllint,
        formatting.yamlfmt,
        --- Hover
        hover.dictionary,
        hover.printenv,
    },
}

return M
