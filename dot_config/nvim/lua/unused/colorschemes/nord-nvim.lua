---@type LazySpec
local spec = {
    "shaunsingh/nord.nvim",
    --lazy = false,
    init = function()
        vim.g.nord_disable_background = vim.g.transparent_enabled
    end,
    --cond = false,
    --enabled = false,
    optional = true,
}

return spec
