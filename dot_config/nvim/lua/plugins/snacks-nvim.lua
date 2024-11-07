---@type LazySpec[]
local dependencies = {
    "echasnovski/mini.icons",
    "nvim-tree/nvim-web-devicons",
}

---@type snacks.Config
local opts = {
    -- TODO: write
    bigfile = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
}

---@type LazySpec
local spec = {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    --ft = "",
    --cmd = "CMDNAME",
    --keys = "",
    --event = "VeryLazy",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
