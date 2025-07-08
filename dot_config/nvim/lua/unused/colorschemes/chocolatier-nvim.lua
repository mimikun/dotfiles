---@type LazySpec
local spec = {
    "qaptoR-nvim/chocolatier.nvim",
    --lazy = false,
    opts = {
        dim_inactive = false,
        transparent_mode = vim.g.transparent_enabled,
    },
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec
