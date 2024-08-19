-- thx: https://github.com/catgoose/nvim/blob/1c72589e73d8b4d99a81b393c31650f047e9ae3d/lua/plugins/nvim-lint.lua

---@type LazySpec
local spec = {
    "mimikun/spec-template",
    lazy = false,
    --event = "VeryLazy",
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            markdown = { "markdownlint" },
            yaml = { "actionlint", "yamllint" },
            zsh = { "zsh", "shellcheck" },
            fish = { "fish" },
            lua = { "selene" },
            python = { "mypy", "pylint" },
            cmake = { "cmakelint" },
            make = { "checkmake" },
            gitcommit = { "commitlint" },
            editorconfig = { "editorconfig-checker" },
            go = { "golangcilint" },
            php = { "phpcs" },
            dockerfile = { "hadolint" },
            bash = { "shellcheck" },
            json = { "jsonlint" },
        }

        --[[
        -- NOTE: confit nvim-lint textlint
        lint.linters.textlint = {
            cmd = "textlint",
            stdin = true,
            append_fname = true,
            args = {},
            stream = nil,
            ignore_exitcode = false,
            env = nil,
            parser = function(output, bufnr, linter_cwd)
            end,
        }
        ]]

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
            callback = function()
                lint.try_lint()
                lint.try_lint("typos")
                --lint.try_lint("textlint")
            end,
        })
    end,
    --cond = false,
    -- NOTE: null-ls replace plugin pattern 1
    enabled = false,
}

return spec
