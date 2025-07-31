---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
    "SmiteshP/nvim-navic",
    "pnx/lualine-lsp-status",
    --"ravitemer/mcphub.nvim",
    "franco-ruggeri/mcphub-lualine.nvim",
    "Dan7h3x/LazyDo",
    "AndreM222/copilot-lualine",
    "Namacha411/ccusage.nvim",
    { "stevearc/aerial.nvim", optional = true },
    { "obsidian-nvim/obsidian.nvim", optional = true },
    { "athar-qadri/weather.nvim", optional = true },
}

return dependencies
