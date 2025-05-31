---@type boolean
local cond = require("config.global").is_linux

---@type table
local cmds = {
    "LazyBackup",
    "LazyRestore",
    "LazyListBackups",
    "LazyRestoreFile",
}

---@type LazySpec
local spec = {
    "jetsgit/lazymanager.nvim",
    --lazy = false,
    cmd = cmds,
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {},
    cond = cond,
    enabled = cond,
}

return spec
