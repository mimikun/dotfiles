---@type LazySpec[]
local dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "nvim-treesitter/nvim-treesitter",
    "smjonas/inc-rename.nvim",
}

if require("config.settings").use_blink_cmp then
    table.insert(dependencies, { "Saghen/blink.cmp" })
else
    table.insert(dependencies, { "hrsh7th/nvim-cmp" })
end

return dependencies
