---@type LazySpec
local spec = {
    "LintaoAmons/context-menu.nvim",
    --lazy = false,
    cmd = "ContextMenu",
    config = function()
        local context_menu = require("context-menu")
        context_menu.setup({
            menu_items = {
                -- Lazy
                {
                    cmd = "Lazy",
                    order = 1,
                    action = {
                        type = "sub_cmds",
                        sub_cmds = {
                            {
                                -- Lazy home
                                cmd = "Lazy home",
                                order = 1,
                                action = {
                                    type = "callback",
                                    callback = function(_)
                                        vim.cmd([[Lazy home]])
                                    end,
                                },
                            },
                            {
                                -- Lazy update
                                cmd = "Lazy update",
                                order = 2,
                                action = {
                                    type = "callback",
                                    callback = function(_)
                                        vim.cmd([[Lazy update]])
                                    end,
                                },
                            },
                        },
                    },
                },
            },
        })
        -- usercmds
        vim.api.nvim_create_user_command("ContextMenu", function()
            context_menu.trigger_context_menu()
        end, {})
    end,
    --cond = false,
}

return spec
