---@type string
local vault_path = vim.fn.expand("$obsidian_vault_path")

---@type table
local cmds = {
    "ObsidianOpen",
    "ObsidianNew",
    "ObsidianQuickSwitch",
    "ObsidianFollowLink",
    "ObsidianBacklinks",
    "ObsidianTags",
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianTomorrow",
    "ObsidianDailies",
    "ObsidianTemplate",
    "ObsidianSearch",
    "ObsidianLink",
    "ObsidianLinkNew",
    "ObsidianLinks",
    "ObsidianExtractNote",
    "ObsidianWorkspace",
    "ObsidianPasteImg",
    "ObsidianRename",
    "ObsidianCheck",
    "ObsidianToggleCheckbox",
}

---@type table
local events = {
    "BufReadPre " .. vault_path .. "/**.md",
    "BufNewFile " .. vault_path .. "/**.md",
}

---@type table
local dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
}

---@type table
local opts = require("plugins.obsidian.options").opts

---@type LazySpec
local spec = {
    "epwalsh/obsidian.nvim",
    version = "*",
    --lazy = false,
    event = events,
    cmd = cmds,
    dependencies = dependencies,
    init = function()
        vim.opt.conceallevel = 2
    end,
    opts = opts,
    --cond = false,
}

return spec
