-- Experimental signature help support
local signature = {
    enabled = true,
    trigger = {
        blocked_trigger_characters = {},
        blocked_retrigger_characters = {},
        -- When true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
        show_on_insert_on_trigger_character = true,
    },
    window = {
        min_width = 1,
        max_width = 100,
        max_height = 10,
        border = "padded",
        winblend = 0,
        winhighlight = "Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder",
        scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
        -- Which directions to show the window,
        -- falling back to the next direction when there's not enough space,
        -- or another window is in the way
        direction_priority = { "n", "s" },
        -- Disable if you run into performance issues
        treesitter_highlighting = true,
    },
}

return signature
