---@type LazySpec[]
local deps = {}

---@type LazySpec[]
deps.base = {
    -- LSP plugins
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    -- DAP plugins
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
    -- Other deps
    "folke/lazydev.nvim",
    "Bilal2453/luvit-meta",
    "justinsgithub/wezterm-types",
    "b0o/schemastore.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "zapling/mason-lock.nvim",
    "folke/neoconf.nvim",
    "b0o/schemastore.nvim",
}

-- mason-null-ls.nvim
---@type table
deps.none_ls = {
    "nvimtools/none-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
}

-- mason-nvim-lint
---@type table
deps.nvim_lint = {
    "mfussenegger/nvim-lint",
    "rshkarin/mason-nvim-lint",
}

-- mason-conform.nvim
---@type table
deps.conform = {
    "stevearc/conform.nvim",
    "zapling/mason-conform.nvim",
}

-- mason-guard.nvim
---@type table
deps.guard = {
    "nvimdev/guard.nvim",
    "nvimdev/guard-collection",
    "mimikun/mason-guard.nvim",
}

-- mason-efmls.nvim
---@type table
deps.efmls = {
    "mimikun/mason-efmls.nvim",
}

return deps
