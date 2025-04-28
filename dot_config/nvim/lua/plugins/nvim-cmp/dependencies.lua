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
    "rcarriga/cmp-dap",
    "chrisgrieser/cmp_yanky",
    "andersevenrud/cmp-tmux",
    { "xzbdmw/colorful-menu.nvim", opts = {}, optional = true },
    --"jghauser/papis.nvim",
    "dnnr1/lorem-ipsum.nvim",
    "samiulsami/cmp-go-deep",
}

if require("config.settings").use_github_copilot then
    table.insert(dependencies, "zbirenbaum/copilot.lua")
    table.insert(dependencies, "zbirenbaum/copilot-cmp")
end

return dependencies
