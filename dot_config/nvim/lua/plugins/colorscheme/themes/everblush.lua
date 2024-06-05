---@type LazySpec
local spec = {
    "Everblush/nvim",
    name = "everblush",
    --lazy = false,
    opts = {
        override = {},
        transparent_background = vim.g.transparent_enabled,
        nvim_tree = {
            contrast = false,
        },
    },
    --cond = false,
}

return spec
