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
    { "iguanacucumber/magazine.nvim", name = "nvim-cmp" },
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
    cmd = require("plugins.obsidian-nvim.cmds"),
    event = events,
    dependencies = dependencies,
    init = function()
        vim.opt.conceallevel = 2
    end,
    config = function()
        require("obsidian").setup(require("plugins.obsidian-nvim.opts"))

        -- HACK: fix error, disable completion.nvim_cmp option, manually register sources
        --[[
        local cmp = require("cmp")
        cmp.register_source("obsidian", require("cmp_obsidian").new())
        cmp.register_source("obsidian_new", require("cmp_obsidian_new").new())
        cmp.register_source("obsidian_tags", require("cmp_obsidian_tags").new())
        ]]
    end,
    --cond = false,
    --enabled = false,
}

return spec
