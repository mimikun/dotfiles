---@type string
local vault_path = vim.fn.expand("$obsidian_vault_path")

---@type table
local events = {
    "BufReadPre " .. vault_path .. "/**.md",
    "BufNewFile " .. vault_path .. "/**.md",
}

---@type LazySpec[]
local dependencies = {
    -- Required
    "nvim-lua/plenary.nvim",
    -- Completion
    "hrsh7th/nvim-cmp",
    -- Pickers
    "nvim-telescope/telescope.nvim",
    -- Syntax highlighting
    "nvim-treesitter/nvim-treesitter",
    -- Miscellaneous
    --"epwalsh/pomo.nvim",
}

---@type LazySpec
local spec = {
    "epwalsh/obsidian.nvim",
    version = "*",
    --lazy = false,
    ft = "markdown",
    cmd = require("plugins.configs.obsidian-nvim.cmds"),
    --keys = "",
    event = events,
    dependencies = dependencies,
    init = function()
        vim.opt.conceallevel = 2
    end,
    opts = require("plugins.configs.obsidian-nvim.opts"),
    --cond = false,
}

return spec
