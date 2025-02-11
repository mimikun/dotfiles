---@class snacks.picker.formatters.Config
local formatters = {
    text = {
        ---@type string? filetype for highlighting
        ft = nil,
    },
    file = {
        -- display filename before the file path
        filename_first = false,
        -- truncate the file path to (roughly) this length
        truncate = 40,
        -- only show the filename
        filename_only = false,
        -- width of the icon (in characters)
        icon_width = 2,
    },
    selected = {
        -- only show the selected column when there are multiple selections
        show_always = false,
        -- use the unselected icon for unselected items
        unselected = true,
    },
    severity = {
        -- show severity icons
        icons = true,
        -- show severity level
        level = false,
        -- position of the diagnostics
        ---@type "left"|"right"
        pos = "left",
    },
}

return formatters
