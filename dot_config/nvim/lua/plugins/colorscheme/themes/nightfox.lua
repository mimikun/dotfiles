---@type table
local opts = {
    options = {
        transparent = vim.g.transparent_enabled,
    },
}

---@type LazySpec
local spec = {
    "EdenEast/nightfox.nvim",
    --lazy = false,
    opts = opts,
    --cond = false,
}

return spec
