---@module 'blink.cmp'
---@type blink.cmp.CompletionConfigPartial
local completion = {
    -- NOTE: Recommended to avoid unnecessary request (milanglacier/minuet-ai.nvim)
    trigger = { prefetch_on_insert = false },
    menu = {
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
    },
    documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
    },
    ghost_text = { enabled = true },
}

return completion
