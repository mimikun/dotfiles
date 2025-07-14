---@type LazySpec[]
local dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
    "HakonHarnes/img-clip.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
    "ravitemer/mcphub.nvim",
    { "ibhagwan/fzf-lua", optional = true },
    { "zbirenbaum/copilot.lua", optional = true },
}

-- NOTE: When Using `blink.cmp` ( `use_blink_cmp = true` ), add `blink.cmp` to dependencies.
if require("config.settings").use_blink_cmp then
    table.insert(dependencies, { "saghen/blink.cmp", optional = true })
-- NOTE: When Using `nvim-cmp` ( `use_blink_cmp = false` ), add `nvim-cmp` to dependencies.
else
    table.insert(dependencies, { "hrsh7th/nvim-cmp", optional = true })
end

return dependencies
