---@type table
local opts = {
    comment_style = "auto",
    doc_width = 80,
    box_width = 60,
    borders = {
        top = "─",
        bottom = "─",
        left = "│",
        right = "│",
        top_left = "╭",
        top_right = "╮",
        bottom_left = "╰",
        bottom_right = "╯",
    },
    line_width = 70,
    lines = {
        line = "─",
        line_start = "─",
        line_end = "─",
        titled_left = "─",
        titled_right = "─",
    },
    outer_blank_lines_above = true,
    outer_blank_lines_below = true,
    inner_blank_lines = false,
    line_blank_line_above = false,
    line_blank_line_below = false,
}

return opts
