---@type LazySpec
local spec = {
    "obsidian-nvim/obsidian.nvim",
    --lazy = false,
    ft = "markdown",
    cmd = "Obsidian",
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
