---@type LazySpec
local spec = {
    "marko-cerovac/material.nvim",
    --lazy = false,
    opts = {
        disable = {
            background = not vim.g.transparent_enabled,
        },
    },
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec
