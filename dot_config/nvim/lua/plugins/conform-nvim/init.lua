---@type LazySpec
local spec = {
    "stevearc/conform.nvim",
    --lazy = false,
    cmd = "ConformInfo",
    keys = require("plugins.conform-nvim.keys"),
    event = "BufWritePre",
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    opts = require("plugins.conform-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
