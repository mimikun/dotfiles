-- NOTE: check exist some commands
---@type boolean
--local has_yq = vim.fn.executable("yq")

---@type boolean
--local has_melos = vim.fn.executable("melos")

---@type LazySpec
local spec = {
    "wasabeef/melos.nvim",
    --lazy = false,
    cmd = require("plugins.melos-nvim.cmds"),
    keys = require("plugins.melos-nvim.keys"),
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = require("plugins.melos-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
