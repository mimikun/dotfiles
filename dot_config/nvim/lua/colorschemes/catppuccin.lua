---@type LazySpec
local spec = {
    "catppuccin/nvim",
    name = "catppuccin",
    --lazy = false,
    opts = {
        transparent_background = vim.g.transparent_enabled,
    },
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec
