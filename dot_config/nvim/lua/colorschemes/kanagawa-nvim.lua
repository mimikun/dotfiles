---@type LazySpec
local spec = {
    "rebelot/kanagawa.nvim",
    --lazy = false,
    opts = {
        transparent = vim.g.transparent_enabled,
        compile = true,
    },
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec
