---@type boolean
local is_linux = require("config.global").is_linux

---@type LazySpec
local spec = {
    "jetsgit/lazymanager.nvim",
    --lazy = false,
    cmd = require("plugins.lazymanager-nvim.cmds"),
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {},
    cond = is_linux,
    enabled = is_linux,
}

return spec
