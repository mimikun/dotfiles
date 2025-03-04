---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "stevearc/dressing.nvim",
    "ravitemer/mcphub.nvim",
}

if require("config.settings").use_blink_cmp then
    table.insert(dependencies, {
        { "saghen/blink.cmp" },
    })
else
    table.insert(dependencies, {
        { "iguanacucumber/magazine.nvim", name = "nvim-cmp" },
    })
end

return dependencies
