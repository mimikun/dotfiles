---@type table
local opts = {
    transparent = vim.g.transparent_enabled,
}

---@type LazySpec
local spec = {
    "pauchiner/pastelnight.nvim",
    --lazy = false,
    opts = opts,
    priority = 1000,
    --cond = false,
}

return spec
