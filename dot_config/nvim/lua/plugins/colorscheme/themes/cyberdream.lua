---@type LazySpec
local spec = {
    "scottmckendry/cyberdream.nvim",
    --lazy = false,
    opts = {
        transparent = vim.g.transparent_enabled,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
        terminal_colors = true,
    },
    --cond = false,
}

return spec
