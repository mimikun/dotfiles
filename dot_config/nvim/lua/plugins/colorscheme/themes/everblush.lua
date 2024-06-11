---@type table
local opts = {
    override = {},
    transparent_background = vim.g.transparent_enabled,
    nvim_tree = {
        contrast = false,
    },
}

---@type LazySpec
local spec = {
    "Everblush/nvim",
    name = "everblush",
    --lazy = false,
    opts = opts,
    --cond = false,
}

return spec
