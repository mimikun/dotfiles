---@type LazySpec
local spec = {
    "Everblush/nvim",
    name = "everblush",
    --lazy = false,
    opts = {
        transparent_background = vim.g.transparent_enabled,
        nvim_tree = {
            contrast = false,
        },
    },
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec
