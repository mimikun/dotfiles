---@type LazySpec[]
local dependencies = {
    -- NOTE: LSP plugins
    "neovim/nvim-lspconfig",
    {
        "mason-org/mason-lspconfig.nvim",
        -- WORKAROUND: v2 has BREAKING CHANGE
        commit = "1a31f824b9cd5bc6f342fc29e9a53b60d74af245",
    },
    -- NOTE: DAP plugins
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
    -- NOTE: Other deps
    "folke/lazydev.nvim",
    "folke/neoconf.nvim",
    "Bilal2453/luvit-meta",
    "justinsgithub/wezterm-types",
    "zapling/mason-lock.nvim",
    "b0o/schemastore.nvim",
    { "Zeioth/mason-extra-cmds", opts = {} },
    { "mkindberg/ghostty-ls", config = true },
    "netmute/ctags-lsp.nvim",
    -- NOTE: mason-null-ls.nvim
    --"nvimtools/none-ls.nvim",
    --"jay-babu/mason-null-ls.nvim",
    -- NOTE: mason-conform.nvim
    "stevearc/conform.nvim",
    "mimikun/mason-conform.nvim",
    -- NOTE: mason-nvim-lint
    "mfussenegger/nvim-lint",
    {
        -- WORKAROUND: HEAD is broken. use patch version
        "mimikun/mason-nvim-lint",
        branch = "patch",
        --"rshkarin/mason-nvim-lint",
        --commit = "910dadb99cb2bf0d5176026c7a4ab1861c4e561f",
    },
}

-- NOTE: completion

-- NOTE: When Using `nvim-cmp` ( `use_blink_cmp = false` ), add `cmp-nvim-lsp` to dependencies.
if not require("config.settings").use_blink_cmp then
    table.insert(dependencies, "hrsh7th/cmp-nvim-lsp")
-- NOTE: When Using `blink.cmp` ( `use_blink_cmp = true` ), add `blink.cmp` to dependencies.
else
    table.insert(dependencies, "saghen/blink.cmp")
end

return dependencies
