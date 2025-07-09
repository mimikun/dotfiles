---@type LazySpec
local spec = {
    "y3owk1n/undo-glow.nvim",
    --lazy = false,
    event = "VeryLazy",
    keys = require("plugins.undo-glow-nvim.keys"),
    config = function()
        local ug = require("undo-glow")
        local ug_utils = require("undo-glow.utils")

        ug.setup(require("plugins.undo-glow-nvim.opts"))

        vim.api.nvim_create_autocmd("TextYankPost", {
            desc = "Highlight when yanking (copying) text",
            callback = function()
                ug.yank()
            end,
        })

        vim.api.nvim_create_autocmd("CursorMoved", {
            desc = "Highlight when cursor moved significantly",
            callback = function()
                ug.cursor_moved({
                    animation = {
                        animation_type = "slide",
                    },
                })
            end,
        })

        vim.api.nvim_create_autocmd("FocusGained", {
            desc = "Highlight when focus gained",
            callback = function()
                ---@type UndoGlow.CommandOpts
                local opts = {
                    animation = {
                        animation_type = "slide",
                    },
                }

                opts = ug_utils.merge_command_opts("UgCursor", opts)
                local pos = ug_utils.get_current_cursor_row()

                ug.highlight_region(vim.tbl_extend("force", opts, {
                    s_row = pos.s_row,
                    s_col = pos.s_col,
                    e_row = pos.e_row,
                    e_col = pos.e_col,
                    force_edge = opts.force_edge == nil and true or opts.force_edge,
                }))
            end,
        })

        vim.api.nvim_create_autocmd("CmdLineLeave", {
            pattern = { "/", "?" },
            desc = "Highlight when search cmdline leave",
            callback = function()
                ug.search_cmd({
                    animation = {
                        animation_type = "fade",
                    },
                })
            end,
        })
    end,
    cond = false,
    enabled = false,
}

return spec
