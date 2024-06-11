---@type table
local opts = {
    transparent_background = vim.g.transparent_enabled,
}

---@type LazySpec
local spec = {
    "loctvl842/monokai-pro.nvim",
    --lazy = false,
    opts = opts,
    --cond = false,
}

return spec
