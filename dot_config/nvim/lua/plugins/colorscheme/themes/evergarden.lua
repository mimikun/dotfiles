---@type table
local opts = {
    transparent_background = vim.g.transparent_enabled,
    contrast_dark = "hard",
    --contrast_dark = "medium",
    --contrast_dark = "soft",
    overrides = {},
}

---@type LazySpec
local spec = {
    "comfysage/evergarden",
    --lazy = false,
    opts = opts,
    --cond = false,
}

return spec
