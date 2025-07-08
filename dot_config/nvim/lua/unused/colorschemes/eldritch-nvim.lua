---@type LazySpec
local spec = {
    "eldritch-theme/eldritch.nvim",
    --lazy = false,
    opts = {
        transparent = vim.g.transparent_enabled,
    },
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec
