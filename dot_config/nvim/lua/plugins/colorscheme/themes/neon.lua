---@type LazySpec
local spec = {
    "rafamadriz/neon",
    --lazy = false,
    config = function()
        vim.g.neon_style = "default"
        --vim.g.neon_style = "dark"
        --vim.g.neon_style = "light"
        vim.g.neon_italic_comment = false
        vim.g.neon_italic_keyword = false
        vim.g.neon_italic_boolean = false
        vim.g.neon_italic_function = false
        vim.g.neon_italic_variable = false
        vim.g.neon_bold = false
        vim.g.neon_transparent = vim.g.transparent_enabled
    end,
    --cond = false,
}

return spec
