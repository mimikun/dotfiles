---@type LazySpec
local spec = {
    "folke/todo-comments.nvim",
    --lazy = false,
    cmd = require("plugins.todo-comments-nvim.cmds"),
    event = "BufEnter",
    dependencies = require("plugins.todo-comments-nvim.dependencies"),
    opts = require("plugins.todo-comments-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
