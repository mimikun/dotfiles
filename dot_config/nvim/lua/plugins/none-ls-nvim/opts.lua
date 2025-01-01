local null_ls = require("null-ls")
--local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
-- TODO: remove it, now testing
-- NOTE: use conform.nvim
--local formatting = null_ls.builtins.formatting

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
        -- TODO: remove it, now testing
        -- NOTE: use conform.nvim
        --[[
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
        ]]
    },
}

return opts
