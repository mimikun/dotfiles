---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    "atusy/aibou.nvim",
    "ravitemer/codecompanion-history.nvim",
    { "nvim-telescope/telescope.nvim", optional = true },
    { "folke/snacks.nvim", optional = true },
    { "OXY2DEV/markview.nvim", optional = true },
    { "MeanderingProgrammer/render-markdown.nvim", optional = true },
}

if require("config.settings").use_blink_cmp then
    table.insert(dependencies, { "saghen/blink.cmp" })
else
    table.insert(dependencies, {
        { "iguanacucumber/magazine.nvim", name = "nvim-cmp" },
    })
end

return dependencies
