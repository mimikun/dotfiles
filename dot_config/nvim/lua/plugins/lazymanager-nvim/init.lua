---@type boolean
local cond = require("config.global").is_linux

---@type LazySpec
local spec = {
    "jetsgit/lazymanager.nvim",
    --lazy = false,
    cmd = require("plugins.lazymanager-nvim.cmds"),
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {},
    cond = cond,
    enabled = cond,
}

return spec
