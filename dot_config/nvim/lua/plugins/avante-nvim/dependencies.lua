---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    { "nvim-tree/nvim-web-devicons", optional = true },
    { "nvim-telescope/telescope.nvim", optional = true },
    { "ravitemer/mcphub.nvim", optional = true },
    { "stevearc/dressing.nvim", optional = true },
    { "folke/snacks.nvim", optional = true },
    { "zbirenbaum/copilot.lua", optional = true },
    { "HakonHarnes/img-clip.nvim", optional = true },
    { "MeanderingProgrammer/render-markdown.nvim", optional = true },
}

-- NOTE: When Using `blink.cmp` ( `use_blink_cmp = true` ), add `blink.cmp` to dependencies.
if require("config.settings").use_blink_cmp then
    table.insert(dependencies, { "saghen/blink.cmp", optional = true })
-- NOTE: When Using `nvim-cmp` ( `use_blink_cmp = false` ), add `nvim-cmp` to dependencies.
else
    table.insert(dependencies, { "hrsh7th/nvim-cmp", optional = true })
end

return dependencies
