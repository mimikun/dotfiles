---@type table
local completion = {
    trigger = require("plugins.blink-cmp.completion.trigger"),
    list = {
        -- Maximum number of items to display
        max_items = 200,

        selection = {
            preselect = function()
                local modori = not require("blink.cmp").snippet_active({ direction = 1 })
                -- HACK: WORKAROUND
                modori = false
                return modori
            end,
            auto_insert = false,
        },
    },
    accept = {
        create_undo_point = true,
        auto_brackets = { enabled = false },
    },
    documentation = {
        auto_show = true,
        treesitter_highlighting = true,
        window = {
            border = "padded",
            winblend = 0,
            scrollbar = true,
        },
    },
    menu = {
        enabled = true,
        border = "none",
        winblend = 0,
        scrollbar = true,
        auto_show = true,
        draw = {
            treesitter = { "lsp" },

            -- Components to render, grouped by column
            columns = {
                { "item_idx" },
                { "kind_icon" },
                { "label", "label_description", gap = 1 },
            },

            components = {
                item_idx = {
                    text = function(ctx)
                        return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx)
                    end,
                    highlight = "BlinkCmpItemIdx",
                },
            },
        },
    },
    ghost_text = { enabled = true },
}

return completion
