-- TODO: config it

---@type LazySpec[]
local dependencies = {
    "neo451/treedoc.nvim",
    "stevearc/conform.nvim",
    "j-hui/fidget.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
}

---@type table
local opts = {
    ---@type string
    db_dir = vim.fn.stdpath("data") .. "/feed",
    ---@type string
    colorscheme = "morning",
    ---@type feed.feed[]
    feeds = {},
}

---@type LazySpec
local spec = {
    "neo451/feed.nvim",
    --lazy = false,
    cmd = "Feed",
    --keys = "",
    --event = "VeryLazy",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
