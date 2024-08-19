---@type table
local cmds = require("plugins.configs.barbar-nvim.cmds")

---@type LazyKeysSpec[]
local keys = require("plugins.configs.barbar-nvim.keys")

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
    cmd = cmds,
    keys = keys,
    event = "BufEnter",
    dependencies = dependencies,
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = opts,
    --cond = false,
    -- NOTE: bufferline/tabline plugin
    --enabled = false,
}

return spec
