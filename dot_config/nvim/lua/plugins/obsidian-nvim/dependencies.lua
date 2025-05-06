---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    { "ibhagwan/fzf-lua", optional = true },
    { "echasnovski/mini.pick", optional = true },
    { "folke/snacks.nvim", optional = true },
    "nvim-treesitter/nvim-treesitter",
    { "preservim/vim-markdown", optional = true },
    { "MeanderingProgrammer/render-markdown.nvim", optional = true },
    { "OXY2DEV/markview.nvim", optional = true },
}

if require("config.settings").use_blink_cmp then
    table.insert(dependencies, {
        { "Saghen/blink.cmp" },
    })
else
    table.insert(dependencies, {
        { "iguanacucumber/magazine.nvim", name = "nvim-cmp" },
    })
end

return dependencies
