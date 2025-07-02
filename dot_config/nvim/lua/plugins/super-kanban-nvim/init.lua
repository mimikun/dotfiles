---@type LazySpec
local spec = {
    "hasansujon786/super-kanban.nvim",
    --lazy = false,
    cmd = "SuperKanban",
    dependencies = require("plugins.super-kanban-nvim.dependencies"),
    opts = require("plugins.super-kanban-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
