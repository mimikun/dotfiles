---@type table
local opts = require("plugins.configs.context-menu-nvim.opts")

---@type LazySpec
local spec = {
    "LintaoAmons/context-menu.nvim",
    --lazy = false,
    cmd = "ContextMenu",
    config = function()
        local context_menu = require("context-menu")
        context_menu.setup(opts)

        -- usercmds
        vim.api.nvim_create_user_command("ContextMenu", function()
            context_menu.trigger_context_menu()
        end, {})
    end,
    --cond = false,
}

return spec
