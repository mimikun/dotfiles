---@type LazySpec
local spec = {
    "sekke276/dark_flat.nvim",
    --lazy = false,
    opts = {
        transparent = vim.g.transparent_enabled,
        colors = {},
        themes = function()
            return {}
        end,
        italics = true,
    },
    --cond = false,
}

return spec
