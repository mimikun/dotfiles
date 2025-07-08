---@type LazySpec
local spec = {
    "github-main-user/lytmode.nvim",
    optional = true,
    opts = {
        transparent = vim.g.transparent_enabled,
    },
}

return spec
