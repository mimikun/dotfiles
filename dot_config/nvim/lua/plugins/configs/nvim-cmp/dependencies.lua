---@type LazySpec[]
local dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "folke/lazydev.nvim",
    "hrsh7th/cmp-emoji",
    "nvim-orgmode/orgmode",
    "SergioRibera/cmp-dotenv",
    "rcarriga/cmp-dap",
}

if require("config.settings").use_github_copilot then
    table.insert(dependencies, "zbirenbaum/copilot.lua")
    table.insert(dependencies, "zbirenbaum/copilot-cmp")
end

return dependencies
