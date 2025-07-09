---@type table
local opts = {
    window = {
        relative = "editor",
        style = "minimal",
        border = "single",
        width = 17,
        height = 1,
    },
    resize_window_to_fit = true,
    text = "You are an idiot!",
    flash_interval = 0,
    focus_cursor = true,
    is_scratch = true,
    min_velocity = 20,
    max_velocity = 30,
    reproduce_count = 5,
    initial = {
        {
            x = "mid",
            y = "mid",
            moving = false,
        },
    },
    delta_time = 0.05,
}

return opts
