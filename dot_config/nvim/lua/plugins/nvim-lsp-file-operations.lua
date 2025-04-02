---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-tree/nvim-tree.lua", optional = true },
    { "nvim-neo-tree/neo-tree.nvim", optional = true },
    { "simonmclean/triptych.nvim", optional = true },
}

---@type LazySpec
local spec = {
    "antosha417/nvim-lsp-file-operations",
    --lazy = false,
    dependencies = dependencies,
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec
