---@type table
local chunk = {
    enable = true,
    style = "#00ffff",
    notify = false,
    priority = 15,
    exclude_filetypes = {
        aerial = true,
        dashboard = true,
    },
    -- unique options
    use_treesitter = true,
    chars = {
        horizontal_line = "─",
        vertical_line = "│",
        left_top = "┌",
        left_bottom = "└",
        right_arrow = "─",
    },
    textobject = "",
    max_file_size = 1024 * 1024,
    error_sign = true,
    -- animation related
    duration = 200,
    delay = 300,
}

return chunk
