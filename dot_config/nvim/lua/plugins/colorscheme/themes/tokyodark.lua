---@type table
local opts = {
    transparent_background = vim.g.transparent_enabled,
}

---@type LazySpec
local spec = {
    "tiagovla/tokyodark.nvim",
    --lazy = false,
    opts = opts,
    --cond = false,
}

return spec
