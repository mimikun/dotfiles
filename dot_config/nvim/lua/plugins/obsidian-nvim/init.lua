---@type LazySpec
local spec = {
    "epwalsh/obsidian.nvim",
    version = "*",
    --lazy = false,
    ft = "markdown",
    cmd = require("plugins.obsidian-nvim.cmds"),
    event = require("plugins.obsidian-nvim.events"),
    dependencies = require("plugins.obsidian-nvim.dependencies"),
    init = function()
        vim.opt.conceallevel = 2
    end,
    opts = require("plugins.obsidian-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
