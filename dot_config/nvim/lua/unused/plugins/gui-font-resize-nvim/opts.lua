---@type table
local opts = {
    -- absolute size it will fallback to when :GUIFontSizeSet is not specified
    default_size = 11,
    -- step value that will inc/dec the fontsize by
    change_by = 1,
    bounds = {
        -- maximum font size, when you try to set a size bigger than this it will default to max
        maximum = 24,
        -- any modification lower than 8 will spring back to 8
        minimum = 8,
    },
}

return opts
