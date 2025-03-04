---@type LazySpec
local spec = {
    "y3owk1n/undo-glow.nvim",
    --lazy = false,
    event = "VeryLazy",
    keys = require("plugins.undo-glow-nvim.keys"),
    config = function()
        local undo_glow = require("undo-glow")
        undo_glow.setup(require("plugins.undo-glow-nvim.opts"))

        vim.api.nvim_create_autocmd("TextYankPost", {
            desc = "Highlight when yanking (copying) text",
            callback = function()
                undo_glow.yank()
            end,
        })

        vim.api.nvim_create_autocmd("CursorMoved", {
            desc = "Highlight when cursor moved significantly",
            callback = function()
                undo_glow.cursor_moved({
                    animation = {
                        animation_type = "slide",
                    },
                })
            end,
        })

        vim.api.nvim_create_autocmd("CmdLineLeave", {
            pattern = { "/", "?" },
            desc = "Highlight when search cmdline leave",
            callback = function()
                undo_glow.search_cmd({
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
