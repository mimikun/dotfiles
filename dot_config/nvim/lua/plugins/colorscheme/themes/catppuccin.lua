---@type table
local opts = {
    transparent_background = vim.g.transparent_enabled,
}

---@type LazySpec
local spec = {
    "catppuccin/nvim",
    name = "catppuccin",
    --lazy = false,
    opts = opts,
    priority = 1000,
    --cond = false,
}

return spec
