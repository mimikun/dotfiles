---@type LazySpec[]
local dependencies = {
    -- NOTE: LSP plugins
    "neovim/nvim-lspconfig",
    "mason-org/mason-lspconfig.nvim",
    -- NOTE: DAP plugins
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
    -- NOTE: Other deps
    "folke/lazydev.nvim",
    "folke/neoconf.nvim",
    "Bilal2453/luvit-meta",
    "justinsgithub/wezterm-types",
    -- NOTE: mason-lock.nvim not support mason v2
    --"zapling/mason-lock.nvim",
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
    "rshkarin/mason-nvim-lint",
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
