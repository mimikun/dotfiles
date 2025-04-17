---@type LazySpec
local spec = {
    "2giosangmitom/nightfall.nvim",
    --lazy = false,
    opts = {
        transparent = vim.g.transparent_enabled,
        dim_inactive = false,
        integrations = {
            illuminate = { enabled = false },
        },
    },
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec
