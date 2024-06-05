---@type LazySpec
--local catppuccin = {
local spec = {
    "catppuccin/nvim",
    name = "catppuccin",
    --lazy = false,
    opts = {
        transparent_background = vim.g.transparent_enabled,
    },
    priority = 1000,
    --cond = false,
}

return spec
