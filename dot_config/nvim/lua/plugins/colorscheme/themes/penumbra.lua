---@type LazySpec
local spec = {
    "Allianaab2m/penumbra.nvim",
    --lazy = false,
    opts = {
        italic_comment = false,
        transparent_bg = vim.g.transparent_enabled,
        show_end_of_buffer = false,
        light = false,
        contrast = nil,
        --contrast = "plus",
        --contrast = "plusplus",
    },
    config = true,
    --cond = false,
}

return spec
