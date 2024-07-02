---@type table
local opts = {
    transparent = vim.g.transparent_enabled,
    dim_inactive = false,
    integrations = {
        illuminate = { enabled = false },
    },
}

---@type LazySpec
local spec = {
    "2giosangmitom/nightfall.nvim",
    --lazy = false,
    opts = opts,
    --cond = false,
    priority = 1000,
}

return spec
