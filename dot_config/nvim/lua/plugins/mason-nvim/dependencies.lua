---@type LazySpec[]
local dependencies = {
    -- LSP plugins
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    -- DAP plugins
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
    -- Other deps
    "folke/lazydev.nvim",
    "folke/neoconf.nvim",
    "Bilal2453/luvit-meta",
    "justinsgithub/wezterm-types",
    "hrsh7th/cmp-nvim-lsp",
    --"saghen/blink.cmp",
    "zapling/mason-lock.nvim",
    "b0o/schemastore.nvim",
    { "Zeioth/mason-extra-cmds", opts = {} },
    -- mason-null-ls.nvim
    --"nvimtools/none-ls.nvim",
    --"jay-babu/mason-null-ls.nvim",
    -- mason-conform.nvim
    "stevearc/conform.nvim",
    "pedrog14/mason-conform.nvim",
    -- mason-nvim-lint
    "mfussenegger/nvim-lint",
    "rshkarin/mason-nvim-lint",
}

return dependencies
