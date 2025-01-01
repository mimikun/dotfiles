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
        textlint = {
            command = function()
                -- TODO: Configuring: use local-installed textlint
                -- `node_modules/.bin/textlint`
                -- table.concat({ "node_modules", ".bin", "textlint" }, global.path_sep)
                -- node_modulesが入ったディレクトリ or nil が返る
                -- ex. `/home/user/.local/share/chezmoi`
                -- vim.fs.root(0, "node_modules")
                return "textlint"
            end,
            args = { "--fix", "$FILENAME" },
        },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
}

return opts
