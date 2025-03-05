---@type LazySpec[]
local dependencies = {
    "kkharji/sqlite.lua",
    "MunifTanjim/nui.nvim",
    "pysan3/pathlib.nvim",
    "nvim-neotest/nvim-nio",
    { "nvim-telescope/telescope.nvim", optional = true },
    { "hrsh7th/nvim-cmp", optional = true },
}

return dependencies
