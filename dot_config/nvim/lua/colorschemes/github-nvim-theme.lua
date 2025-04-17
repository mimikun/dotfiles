---@module 'GhTheme'
---@type GhTheme.Config.Options
local opts = {
    transparent = vim.g.transparent_enabled,
}

---@type LazySpec
local spec = {
    "projekt0n/github-nvim-theme",
    --lazy = false,
    config = function()
        require("github-theme").setup(opts)
    end,
    --cond = false,
    --enabled = false,
    --optional = true,
}

return spec
