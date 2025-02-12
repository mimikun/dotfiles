---@type table
local opts = {
    -- Show a line at the bottom with registers that aren't filled
    show_empty = true,
    symbols = {
        -- Show a special character for line breaks
        newline = "⏎",
        -- Show space characters without changes
        space = " ",
        -- Show a special character for tabs
        tab = "·",
        -- The character to show when a register will be applied in a char-wise fashion
        register_type_charwise = "ᶜ",
        -- The character to show when a register will be applied in a line-wise fashion
        register_type_linewise = "ˡ",
        -- The character to show when a register will be applied in a block-wise fashion
        register_type_blockwise = "ᵇ",
    },
    window = {
        -- The window can't be wider than 100 characters
        max_width = 100,
        -- Don't draw a border around the registers window
        border = "none",
        -- Apply a tiny bit of transparency to the the window, letting some characters behind it bleed through
        transparency = 10,
    },
}

return opts
