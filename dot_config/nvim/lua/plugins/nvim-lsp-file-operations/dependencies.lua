---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-tree/nvim-tree.lua", optional = true },
    { "nvim-neo-tree/neo-tree.nvim", optional = true },
    { "simonmclean/triptych.nvim", optional = true },
}

return dependencies
