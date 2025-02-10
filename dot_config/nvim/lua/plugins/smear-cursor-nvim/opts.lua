---@type table
local opts = {
    -- General configuration
    -- Smear cursor when switching buffers or windows
    smear_between_buffers = true,

    -- Smear cursor when moving within line or to neighbor lines
    -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
    smear_between_neighbor_lines = true,

    -- Only smear cursor when moving at least these distances
    min_horizontal_distance_smear = 0,
    min_vertical_distance_smear = 0,

    -- Smear cursor when entering or leaving command line mode
    smear_to_cmd = true,

    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,

    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears will blend better on all backgrounds.
    legacy_computing_symbols_support = true,

    -- Set to `true` if your cursor is a vertical bar in normal mode.
    vertical_bar_cursor = false,

    -- Smear cursor in insert mode.
    -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
    smear_insert_mode = true,

    -- Set to `true` if your cursor is a vertical bar in insert mode.
    vertical_bar_cursor_insert_mode = true,

    -- Smear cursor in replace mode.
    smear_replace_mode = false,

    -- Set to `true` if your cursor is a horizontal bar in replace mode.
    horizontal_bar_cursor_replace_mode = true,

    -- Attempt to hide the real cursor by drawing a character below it.
    -- Can be useful when not using `termguicolors`
    hide_target_hack = true,

    -- Number of windows that stay open for rendering.
    max_kept_windows = 50,

    -- Adjust to have the smear appear above or below other floating windows
    windows_zindex = 300,

    -- List of filetypes where the plugin is disabled.
    filetypes_disabled = {},

    -- Sets animation framerate
    -- msec
    time_interval = 17,

    -- Amount of time the cursor has to stay still before triggering animation.
    -- Useful if the target changes and rapidly comes back to its original position.
    -- E.g. when hitting a keybinding that triggers CmdlineEnter.
    -- Increase if the cursor makes weird jumps when hitting keys.
    -- msec
    delay_event_to_smear = 1,

    -- Delay for `vim.on_key` to avoid redundancy with vim events triggers.
    -- msec
    delay_after_key = 1,

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
    -- < 0: less slowdown, > 0: more slowdown. Keep small, e.g. [-0.2, 0.2]
    slowdown_exponent = 0,

    -- Stop animating when the smear's tail is within this distance (in characters) from the target.
    distance_stop_animating = 0.1,

    -- Set of parameters for insert mode
    stiffness_insert_mode = 0.3,
    trailing_stiffness_insert_mode = 0.3,
    trailing_exponent_insert_mode = 1,
    -- Can be decreased (e.g. to 0.1) if using legacy computing symbols
    distance_stop_animating_vertical_bar = 0.875,

    -- When to switch between rasterization methods
    max_slope_horizontal = 0.5,
    min_slope_vertical = 2,

    -- Minimum 1, don't set manually if using cterm_cursor_colors
    color_levels = 16,
    -- For color blending
    gamma = 2.2,
    -- 0: more overhangs, 1: more matrices
    max_shade_no_matrix = 0.75,
    -- 0: all pixels, 1: no pixel
    matrix_pixel_threshold = 0.5,

    -- 0: all pixels, 1: no pixel
    matrix_pixel_threshold_vertical_bar = 0.3,
    -- 0: all pixels, 1: no pixel
    matrix_pixel_min_factor = 0.5,
    -- 0: no reduction, 1: full reduction
    volume_reduction_exponent = 0.3,
    -- 0: no limit, 1: no reduction
    minimum_volume_factor = 0.5,
    -- Maximum smear length
    max_length = 25,
    max_length_insert_mode = 1,
    -- Color configuration

    -- Smear cursor color. Defaults to Cursor GUI color if not set.
    -- Set to "none" to match the text color at the target cursor position.
    cursor_color = "#d3cdc3",

    -- Background color. Defaults to Normal GUI background color if not set.
    normal_bg = "#282828",

    -- Set when the background is transparent and when not using legacy computing symbols.
    transparent_bg_fallback_color = "#303030",

    -- Cterm color gradient, from bg color (excluded) to cursor color (included)
    cterm_cursor_colors = {
        240,
        241,
        242,
        243,
        244,
        245,
        246,
        247,
        248,
        249,
        250,
        251,
        252,
        253,
        254,
        255,
    },

    -- Cterm background color. Must set when not using legacy computing symbols.
    cterm_bg = 235,
}

return opts
