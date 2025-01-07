---@type string
local vault_path = vim.fn.expand("$obsidian_vault_path")

---@type table
local events = {
    "BufReadPre " .. vault_path .. "/**.md",
    "BufNewFile " .. vault_path .. "/**.md",
}

---@type LazySpec
local spec = {
    "epwalsh/obsidian.nvim",
    version = "*",
    --lazy = false,
    ft = "markdown",
    cmd = require("plugins.obsidian-nvim.cmds"),
    event = events,
    dependencies = require("plugins.obsidian-nvim.dependencies"),
    init = function()
        vim.opt.conceallevel = 2
    end,
    opts = require("plugins.obsidian-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
