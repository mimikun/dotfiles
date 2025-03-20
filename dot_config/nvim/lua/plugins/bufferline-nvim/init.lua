---@type LazySpec
local spec = {
    "akinsho/bufferline.nvim",
    version = "*",
    --lazy = false,
    cmd = require("plugins.bufferline-nvim.cmds"),
    keys = require("plugins.bufferline-nvim.keys"),
    event = "BufEnter",
    dependencies = require("plugins.bufferline-nvim.dependencies"),
    init = function()
        vim.opt.termguicolors = true
    end,
    config = function()
        require("bufferline").setup(require("plugins.bufferline-nvim.opts"))
    end,
    cond = false,
    enabled = false,
}

return spec
