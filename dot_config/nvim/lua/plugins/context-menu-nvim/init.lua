---@type LazySpec
local spec = {
    "LintaoAmons/context-menu.nvim",
    --lazy = false,
    cmd = "ContextMenuTrigger",
    dependencies = require("plugins.context-menu-nvim.dependencies"),
    config = function()
        local ctx_menu = require("context-menu")
        ctx_menu.setup(require("plugins.context-menu-nvim.opts"))
        ctx_menu.add_items(require("plugins.context-menu-nvim.custom_items"))
    end,
    cond = false,
    enabled = false,
}

return spec
