local cspell = require("cspell")
local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

---@type table
local opts = {
    sources = {
        require("buffls"),
        --- Code Actions
        cspell.code_actions,
        --- Diagnostics
        diagnostics.fish,
        diagnostics.selene,
        diagnostics.textlint.with({
            only_local = "node_modules/.bin",
        }),
        diagnostics.yamllint,
        cspell.diagnostics,
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
    },
}

return opts
