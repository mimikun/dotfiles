---@type LazySpec
local spec = {
    "kode-team/mastodon.nvim",
    --lazy = false,
    cmd = require("plugins.mastodon-nvim.cmds"),
    dependencies = require("plugins.mastodon-nvim.dependencies"),
    opts = {},
    cond = false,
    enabled = false,
}

return spec
