---@type LazySpec[]
local dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
}

---@type table
local opts = {
    exclude_ft = {},
}

---@type LazySpec
local spec = {
    "romgrk/barbar.nvim",
    --lazy = false,
    cmd = require("plugins.barbar-nvim.cmds"),
    keys = require("plugins.barbar-nvim.keys"),
    event = "BufEnter",
    dependencies = dependencies,
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
