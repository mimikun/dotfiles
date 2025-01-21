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
    config = function()
        require("conform").setup(require("plugins.conform-nvim.opts"))
    end,
    --cond = false,
    --enabled = false,
}

return spec
