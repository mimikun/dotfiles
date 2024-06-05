---@type LazySpec
local spec = {
    "folke/tokyonight.nvim",
    --lazy = false,
    opts = {
        style = "storm",
        --style = "moon",
        --style = "night",
        --style = "day",
        light_style = "day",
        transparent = vim.g.transparent_enabled,
        terminal_colors = true,
    },
    --cond = false,
}

return spec
