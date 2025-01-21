---@module "conform"
---@type conform.setupOpts
local opts = {
    formatters_by_ft = {
        fish = { "fish_indent" },
        lua = { "stylua" },
        luau = { "stylua" },
        nix = { "nixfmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier", "textlint" },
        svelte = { "prettier" },
        astro = { "prettier" },
        sh = { "shfmt" },
        txt = { "textlint" },
    },
    formatters = {
        textlint = require("plugins.conform-nvim.textlint"),
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
}

return opts
