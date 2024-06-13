---@type table
local opts = {
    transparent = vim.g.transparent_enabled,
    -- enable compiling the colorscheme
    compile = false,
}

---@type LazySpec
local spec = {
    "rebelot/kanagawa.nvim",
    --lazy = false,
    opts = opts,
    --cond = false,
}

return spec
