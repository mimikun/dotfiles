---@type LazySpec
local spec = {
    "EdenEast/nightfox.nvim",
    --lazy = false,
    opts = {
        options = {
            transparent = vim.g.transparent_enabled,
        },
    },
    --cond = false,
}

return spec
