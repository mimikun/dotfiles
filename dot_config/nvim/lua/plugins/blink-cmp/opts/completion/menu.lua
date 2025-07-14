---@type table
local menu = {
    min_width = 15,
    max_height = 10,
    border = nil,
    winblend = 0,
    draw = {
        treesitter = { "lsp" },
        columns = { { "kind_icon" }, { "label", gap = 1 } },
        components = {
            label = {
                text = function(ctx)
                    return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                    return require("colorful-menu").blink_components_highlight(ctx)
                end,
            },
        },
    },
}

return menu
