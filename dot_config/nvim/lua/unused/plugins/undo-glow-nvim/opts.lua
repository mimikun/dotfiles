---@type UndoGlow.Config
local opts = {
    animation = {
        enabled = true,
        duration = 300,
        animation_type = "zoom",
        fps = 120,
        easing = "in_out_cubic",
    },
    highlights = {
        undo = {
            hl = "UgUndo",
            hl_color = { bg = "#FF5555" },
        },
        redo = {
            hl = "UgRedo",
            hl_color = { bg = "#50FA7B" },
        },
        yank = {
            hl = "UgYank",
            hl_color = { bg = "#F1FA8C" },
        },
        paste = {
            hl = "UgPaste",
            hl_color = { bg = "#8BE9FD" },
        },
        search = {
            hl = "UgSearch",
            hl_color = { bg = "#BD93F9" },
        },
        comment = {
            hl = "UgComment",
            hl_color = { bg = "#FFB86C" },
        },
        cursor = {
            hl = "UgCursor",
            hl_color = { bg = "#FF79C6" },
        },
    },
    priority = 4096,
}

return opts
