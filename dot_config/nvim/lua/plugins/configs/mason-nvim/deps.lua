local settings = require("config.settings")

---@type LazySpec[]
local deps = {}

---@type LazySpec[]
local base = {
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
    { "Zeioth/mason-extra-cmds", opts = {} },
}

-- mason-null-ls.nvim
---@type table
local none_ls = {
    "nvimtools/none-ls.nvim",
    "jay-babu/mason-null-ls.nvim",
}

-- mason-nvim-lint
---@type table
local nvim_lint = {
    "mfussenegger/nvim-lint",
    "rshkarin/mason-nvim-lint",
}

-- mason-conform.nvim
---@type table
local conform = {
    "stevearc/conform.nvim",
    "zapling/mason-conform.nvim",
}

-- mason-guard.nvim
---@type table
local guard = {
    "nvimdev/guard.nvim",
    "nvimdev/guard-collection",
    "mimikun/mason-guard.nvim",
}

-- mason-efmls.nvim
---@type table
local efmls = {
    "mimikun/mason-efmls.nvim",
}

if settings.use_none_ls then
    deps = vim.list_extend(base, none_ls)
elseif settings.use_efmls then
    deps = vim.list_extend(base, efmls)
else
    deps = vim.list_extend(base, nvim_lint)
    if settings.use_guard then
        deps = vim.list_extend(base, guard)
    elseif settings.use_conform then
        deps = vim.list_extend(base, conform)
    end
end

return deps
