local columns = {
    -- Components to render, grouped by column
    base = {
        { "item_idx" },
        { "kind_icon" },
        { "label", "label_description", gap = 1 },
    },
    colorful_menu = {
        { "kind_icon" },
        { "label", gap = 1 },
    },
}

local components = {
    base = {
        item_idx = {
            text = function(ctx)
                return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx)
            end,
            highlight = "BlinkCmpItemIdx",
        },
    },
    colorful_menu = {
        label = {
            text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
            end,
            highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
            end,
        },
    },
}

local draw = {
    treesitter = { "lsp" },
    columns = columns.base,
    components = components.base,
}

return draw
