---@type LazySpec
local spec = {
    "shaunsingh/nord.nvim",
    --lazy = false,
    config = function()
        vim.g.nord_disable_background = vim.g.transparent_enabled
    end,
    --cond = false,
}

return spec
