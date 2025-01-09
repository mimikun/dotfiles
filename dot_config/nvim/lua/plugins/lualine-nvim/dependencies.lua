---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
    "SmiteshP/nvim-navic",
    "pnx/lualine-lsp-status",
}

if require("config.settings").use_github_copilot then
    table.insert(dependencies, {
        { "AndreM222/copilot-lualine" },
    })
end

return dependencies
