---@type table
local cmds = {
    "TodoQuickFix",
    "TodoLocList",
    "TodoTelescope",
}

---@type LazySpec[]
local dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
}

---@type LazySpec
local spec = {
    "folke/todo-comments.nvim",
    --lazy = false,
    cmd = cmds,
    event = "BufEnter",
    dependencies = dependencies,
    opts = require("plugins.configs.todo-comments-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
