---@type boolean
--local is_fd_available = vim.fn.executable("fd") == 1

---@type boolean
local cond = require("config.global").is_linux

---@type LazySpec
local spec = {
    "Eutrius/Otree.nvim",
    lazy = false,
    cmd = require("plugins.otree-nvim.cmds"),
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("plugins.otree-nvim.opts"),
    cond = cond,
    enabled = cond,
}

return spec
