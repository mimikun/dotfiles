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

        -- register custom linter
        --lint.linters.textlint = require("plugins.nvim-lint.textlint")

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
