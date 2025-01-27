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
        draw = require("plugins.blink-cmp.completion.draw"),
    },
    ghost_text = { enabled = true },
}

return completion
