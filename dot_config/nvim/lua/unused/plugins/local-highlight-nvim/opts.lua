---@type table
local opts = {
    file_types = { "python", "cpp" },
    disable_file_types = { "tex" },
    hlgroup = "LocalHighlight",
    cw_hlgroup = nil,
    insert_mode = false,
    min_match_len = 1,
    max_match_len = math.huge,
    highlight_single_match = true,
    animate = {
        enabled = true,
        easing = "linear",
        duration = {
            step = 10,
            total = 100,
        },
    },
    debounce_timeout = 200,
}

return opts
