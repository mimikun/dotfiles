---@type LazySpec[]
local dependencies = {
    -- NOTE: Pickers
    "nvim-telescope/telescope.nvim",
    -- NOTE: Image viewing
    "folke/snacks.nvim",
    -- NOTE: Syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    "MeanderingProgrammer/render-markdown.nvim",
    --{ "OXY2DEV/markview.nvim", optional = true },
}

-- NOTE: Completion
if require("config.settings").use_blink_cmp then
    table.insert(dependencies, { "Saghen/blink.cmp" })
else
    table.insert(dependencies, { "hrsh7th/nvim-cmp" })
end

return dependencies
