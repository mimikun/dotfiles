---@type LazySpec[]
local dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "nvim-treesitter/nvim-treesitter",
    "smjonas/inc-rename.nvim",
}

if require("config.settings").use_blink_cmp then
    table.insert(dependencies, "Saghen/blink.cmp")
else
    table.insert(dependencies, {
        { "iguanacucumber/magazine.nvim", name = "nvim-cmp" },
    })
end

return dependencies
