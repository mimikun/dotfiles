---@type LazySpec[]
local dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
    { "ibhagwan/fzf-lua", optional = true },
    { "nvim-telescope/telescope-ui-select.nvim", optional = true },
    { "folke/snacks.nvim", optional = true },
    { "echasnovski/mini.pick", optional = true },
}

return dependencies
