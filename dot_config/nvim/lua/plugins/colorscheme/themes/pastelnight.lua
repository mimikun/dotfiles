---@type LazySpec
local spec = {
    "pauchiner/pastelnight.nvim",
    --lazy = false,
    opts = {
        transparent = vim.g.transparent_enabled,
    },
    priority = 1000,
    --cond = false,
}

return spec
