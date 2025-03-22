---@type LazySpec
local spec = {
    "HiPhish/rainbow-delimiters.nvim",
    --lazy = false,
    config = function()
        vim.g.rainbow_delimiters = require("plugins.rainbow-delimiters-nvim.opts")
    end,
    cond = false,
    enabled = false,
}

return spec
