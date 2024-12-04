---@type table
local opts = {
    -- Smear cursor color. Defaults to Cursor GUI color if not set.
    -- Set to "none" to match the text color at the target cursor position.
    cursor_color = "#d3cdc3",

    -- Background color. Defaults to Normal GUI background color if not set.
    normal_bg = "#282828",

    -- General configuration
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,

    -- need background transparent
    legacy_computing_symbols_support = true,
    transparent_bg_fallback_color = "#303030",

    -- Smear configuration
    -- How fast the smear's head moves towards the target.
    -- 0: no movement, 1: instantaneous
    stiffness = 0.6,

    -- How fast the smear's tail moves towards the target.
    -- 0: no movement, 1: instantaneous
    trailing_stiffness = 0.25,

    -- Controls if middle points are closer to the head or the tail.
    -- < 1: closer to the tail, > 1: closer to the head
    trailing_exponent = 2,

    -- How much the smear slows down when getting close to the target.
    -- 0: no slowdown, more: more slowdown
    slowdown_exponent = 0,

    -- Stop animating when the smear's tail is within this distance (in characters) from the target.
    distance_stop_animating = 0.1,

    -- When to switch between rasterization methods
    max_slope_horizontal = 0.5,
    min_slope_vertical = 2,

    -- Minimum 1
    color_levels = 16,

    -- For color blending,
    gamma = 2.2,

    -- 0: more overhangs, 1: more matrices
    max_shade_no_matrix = 0.75,

    -- 0: all pixels, 1: no pixel
    matrix_pixel_threshold = 0.5,

    -- 0: all pixels, 1: no pixel
    matrix_pixel_min_factor = 0.5,

    -- 0: no reduction, 1: full reduction
    volume_reduction_exponent = 0.3,

    -- 0: no limit, 1: no reduction
    minimum_volume_factor = 0.5,
}

return opts
