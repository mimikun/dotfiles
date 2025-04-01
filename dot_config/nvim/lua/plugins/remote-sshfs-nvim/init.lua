---@type LazySpec
local spec = {
    "nosduco/remote-sshfs.nvim",
    --lazy = false,
    cmd = require("plugins.remote-sshfs-nvim.cmds"),
    keys = require("plugins.remote-sshfs-nvim.keys"),
    dependencies = require("plugins.remote-sshfs-nvim.dependencies"),
    opts = require("plugins.remote-sshfs-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
