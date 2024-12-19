---@type string
local vault_path = vim.fn.expand("$obsidian_vault_path")

---@type table
local events = {
    "BufReadPre " .. vault_path .. "/**.md",
    "BufNewFile " .. vault_path .. "/**.md",
}

---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    --{ "iguanacucumber/magazine.nvim", name = "nvim-cmp" },
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    --"epwalsh/pomo.nvim",
}

---@type LazySpec
local spec = {
    "epwalsh/obsidian.nvim",
    version = "*",
    --lazy = false,
    ft = "markdown",
    cmd = require("plugins.configs.obsidian-nvim.cmds"),
    event = events,
    dependencies = dependencies,
    init = function()
        vim.opt.conceallevel = 2
    end,
    opts = require("plugins.configs.obsidian-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
