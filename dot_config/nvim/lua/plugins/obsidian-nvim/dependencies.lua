---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    --"folke/snacks.nvim",
    "nvim-treesitter/nvim-treesitter",
    --"epwalsh/pomo.nvim",
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
