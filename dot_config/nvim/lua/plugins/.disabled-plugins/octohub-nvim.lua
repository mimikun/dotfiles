-- TODO: install it
--[[
https://github.com/2kabhishek/tmux-tea
and configuring `set -g @tea-default-command 'nvim'`
]]

---@type LazySpec
local spec = {
    "2kabhishek/octohub.nvim",
    --lazy = false,
    cmd = require("plugins.configs.octohub-nvim.cmds"),
    --keys = require("plugins.configs.octohub-nvim.keys"),
    --event = "VeryLazy",
    dependencies = require("plugins.configs.octohub-nvim.dependencies"),
    opts = require("plugins.configs.octohub-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
