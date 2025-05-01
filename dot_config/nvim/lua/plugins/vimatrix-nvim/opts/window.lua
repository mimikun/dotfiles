---@type vx.window
local window = {
    general = {
        -- TIP: You can use the `ignore_cells` callback option in the `window` settings to manage the amount of rendering.
        -- This is also quite effective at reducing CPU usage.
        ignore_cells = nil,
    },
    by_filetype = {
        snacks_dashboard = {
            background = "",
            blend = 100,
        },
    },
}

return window
