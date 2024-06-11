---@type table
local opts = {
    transparent = vim.g.transparent_enabled,
    italic_comments = true,
    hide_fillchars = true,
    borderless_telescope = true,
    terminal_colors = true,
}

---@type LazySpec
local spec = {
    "scottmckendry/cyberdream.nvim",
    --lazy = false,
    opts = opts,
    --cond = false,
}

return spec
