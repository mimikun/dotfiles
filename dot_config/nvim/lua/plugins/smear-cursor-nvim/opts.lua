---@type table
local opts = {
    --- General configuration
    -- need background transparent
    legacy_computing_symbols_support = true,
    hide_target_hack = true,
    max_kept_windows = 50,
    windows_zindex = 300,
    filetypes_disabled = {},
    time_interval = 17,

    --- Color configuration
    cursor_color = "#d3cdc3",
    normal_bg = "#282828",
    transparent_bg_fallback_color = "#303030",

    --- Smear configuration
    trailing_stiffness = 0.25,
    trailing_exponent = 2,
    slowdown_exponent = 0,
    distance_stop_animating = 0.1,
    max_slope_horizontal = 0.5,
    min_slope_vertical = 2,
    color_levels = 16,
    gamma = 2.2,
    max_shade_no_matrix = 0.75,
    matrix_pixel_threshold = 0.5,
    matrix_pixel_min_factor = 0.5,
    volume_reduction_exponent = 0.3,
    minimum_volume_factor = 0.5,
}

return opts
