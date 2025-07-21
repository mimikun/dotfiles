---@type boolean
local is_linux = require("config.global").is_linux

---@type LazySpec
local spec = {
    "Eutrius/Otree.nvim",
    lazy = false,
    cmd = require("plugins.otree-nvim.cmds"),
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("plugins.otree-nvim.opts"),
    cond = is_linux,
    enabled = is_linux,
}

return spec
