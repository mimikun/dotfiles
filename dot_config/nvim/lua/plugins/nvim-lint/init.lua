---@type table
local events = {
    "BufWritePost",
    "BufReadPost",
    "InsertLeave",
}

---@type LazySpec
local spec = {
    "mfussenegger/nvim-lint",
    --lazy = false,
    --cmd = "LintInfo",
    event = events,
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            -- BUG: not work
            --fish = { "fish" },
            lua = { "selene" },
            luau = { "selene" },
            yaml = { "yamllint" },
            -- textlint
            --txt = { "textlint" },
            --markdown = { "textlint" },
        }

        -- register custom linter
        -- TODO: textlint
        --[[
        Filetypes: { "txt", "markdown" }
        Method: diagnostics
        Command: textlint
        Args: { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" }

        require("lint").linters.textlint = {
            name = "textlint",
            cmd = "textlint",
            stdin = true,
            -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
            args = {},
            -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
            stream = nil,
            -- set this to true if the linter exits with a code != 0 and that's considered normal.
            ignore_exitcode = false,
            -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
            env = nil,
            parser = function()
                return nil
            end,
        }
        ]]

        vim.api.nvim_create_autocmd(events, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
    --cond = false,
    --enabled = false,
}

return spec
