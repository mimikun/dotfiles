---@type table
local opts = {
    transparent = vim.g.transparent_enabled,
    colors = {},
    themes = function()
        return {}
    end,
    italics = true,
}

---@type LazySpec
local spec = {
    "sekke276/dark_flat.nvim",
    --lazy = false,
    opts = opts,
    --cond = false,
}

return spec
