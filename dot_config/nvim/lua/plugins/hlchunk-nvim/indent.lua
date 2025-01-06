---@type table
local indent = {
    enable = true,
    style = {
        "#FF0000",
        "#FF7F00",
        "#FFFF00",
        "#00FF00",
        "#00FFFF",
        "#0000FF",
        "#8B00FF",
    },
    notify = false,
    priority = 10,
    exclude_filetypes = {
        aerial = true,
        dashboard = true,
        -- some other filetypes
    },
    -- unique options
    use_treesitter = false,
    chars = {
        "│",
    },
    ahead_lines = 5,
    delay = 100,
}

return indent
