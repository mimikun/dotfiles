---@type LazySpec
local spec = {
    "kevinhwang91/nvim-ufo",
    --lazy = false,
    cmd = require("plugins.nvim-ufo.cmds"),
    keys = require("plugins.nvim-ufo.keys"),
    dependencies = { "kevinhwang91/promise-async" },
    init = function()
        vim.opt.foldcolumn = "1"
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
        vim.opt.foldenable = true
    end,
    config = function()
        require("ufo").setup(require("plugins.nvim-ufo.opts"))
    end,
    cond = false,
    enabled = false,
}

return spec
