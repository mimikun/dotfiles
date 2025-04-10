---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local emoji = {
    module = "blink-emoji",
    name = "Emoji",
    -- Tune by preference
    score_offset = 15,
    opts = {
        -- Insert emoji (default) or complete its name
        insert = true,
    },
    should_show_items = function()
        return vim.tbl_contains(
            -- Enable emoji completion only for git commits and markdown.
            -- By default, enabled for all file-types.
            { "gitcommit", "markdown" },
            vim.o.filetype
        )
    end,
}

return emoji
