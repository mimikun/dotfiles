---@type LazySpec[]
local dependencies = {
    "mikavilpas/blink-ripgrep.nvim",
    "folke/lazydev.nvim",
    "hrsh7th/cmp-emoji",
    "rcarriga/cmp-dap",
    "chrisgrieser/cmp_yanky",
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    { "saghen/blink.compat", opts = {} },
}

if require("config.settings").use_github_copilot then
    table.insert(dependencies, "zbirenbaum/copilot.lua")
    table.insert(dependencies, "giuxtaposition/blink-cmp-copilot")
end

return dependencies
