if vim.g.neovide then
    --- Display
    -- Font
    vim.o.guifont = "Cica:h14"

    -- Line spacing
    vim.opt.linespace = 0

    -- Scale
    vim.g.neovide_scale_factor = 1.0

    -- Text Gamma and Contrast
    vim.g.neovide_text_gamma = 0.0
    vim.g.neovide_text_contrast = 0.5

    -- Padding
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    -- Floating Blur Amount
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0

    -- Floating Shadow
    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 5

    -- Transparency
    vim.g.neovide_transparency = 0.93

    -- Scroll Animation Length
    vim.g.neovide_scroll_animation_length = 0.3

    -- Far scroll lines
    vim.g.neovide_scroll_animation_far_lines = 1

    -- Hiding the mouse when typing
    vim.g.neovide_hide_mouse_when_typing = false

    -- Underline automatic scaling
    vim.g.neovide_underline_stroke_scale = 1.0

    ---@type table|string
    local neovide_themes = {
        light = "light",
        dark = "dark",
        auto = "auto",
    }

    -- Theme
    vim.g.neovide_theme = neovide_themes.dark

    -- Layer grouping
    vim.g.experimental_layer_grouping = false

    --- Functionality
    -- Refresh Rate
    vim.g.neovide_refresh_rate = 60

    -- Idle Refresh Rate
    vim.g.neovide_refresh_rate_idle = 5

    -- No Idle
    vim.g.neovide_no_idle = true

    -- Confirm Quit
    vim.g.neovide_confirm_quit = true

    -- Fullscreen
    -- TODO: fix
    vim.g.neovide_fullscreen = true

    -- Remember Previous Window Size
    vim.g.neovide_remember_window_size = true

    -- Profiler
    -- TODO: fix
    vim.g.neovide_profiler = true

    --- Input Settings
    -- IME
    -- TODO: fix
    vim.g.neovide_input_ime = true

    local function set_ime(args)
        if args.event:match("Enter$") then
            vim.g.neovide_input_ime = true
        else
            vim.g.neovide_input_ime = false
        end
    end

    local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

    vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
        group = ime_input,
        pattern = "*",
        callback = set_ime,
    })

    vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
        group = ime_input,
        pattern = "[/\\?]",
        callback = set_ime,
    })

    -- Touch Deadzone
    vim.g.neovide_touch_deadzone = 6.0

    -- Touch Drag Timeout
    vim.g.neovide_touch_drag_timeout = 0.17

    --- Cursor Settings
    -- Animation Length
    vim.g.neovide_cursor_animation_length = 0.13

    -- Animation Trail Size
    vim.g.neovide_cursor_trail_size = 0.8

    -- Antialiasing
    vim.g.neovide_cursor_antialiasing = true

    -- Animate in insert mode
    vim.g.neovide_cursor_animate_in_insert_mode = true

    -- Animate switch to command line
    vim.g.neovide_cursor_animate_command_line = true

    -- Unfocused Outline Width
    vim.g.neovide_cursor_unfocused_outline_width = 0.125

    -- Animate cursor blink
    vim.g.neovide_cursor_smooth_blink = false

    --- Cursor Particles
    local cursor_vfx_modes = {
        -- None at all
        none_at_all = "",
        -- Railgun
        railgun = "railgun",
        -- Torpedo
        torpedo = "torpedo",
        -- Pixiedust
        pixiedust = "pixiedust",
        -- Sonic Boom
        sonicboom = "sonicboom",
        -- Ripple
        ripple = "ripple",
        -- Wireframe
        wireframe = "wireframe",
    }

    vim.g.neovide_cursor_vfx_mode = cursor_vfx_modes.wireframe

    --- Particle Settings
    -- Particle Opacity
    vim.g.neovide_cursor_vfx_opacity = 200.0

    -- Particle Lifetime
    vim.g.neovide_cursor_vfx_particle_lifetime = 1.2

    -- Particle Density
    vim.g.neovide_cursor_vfx_particle_density = 7.0

    -- Particle Speed
    vim.g.neovide_cursor_vfx_particle_speed = 10.0

    -- NOTE: Only for the railgun vfx mode.
    if vim.g.neovide_cursor_vfx_mode == cursor_vfx_modes.railgun then
        -- Particle Phase
        vim.g.neovide_cursor_vfx_particle_phase = 1.5

        -- Particle Curl
        vim.g.neovide_cursor_vfx_particle_curl = 1.0
    end

    if require("config.global").is_mac then
        --- Helper function for transparency formatting
        ---@return string
        local alpha = function()
            return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
        end

        --- Display
        -- Background Color
        ---@type string
        local neovide_background_color = "#0f1117"

        vim.g.neovide_transparency = 0.0
        vim.g.transparency = 0.93
        vim.g.neovide_background_color = neovide_background_color .. alpha()

        -- Window Blur
        vim.g.neovide_window_blurred = true

        -- Show Border
        vim.g.neovide_show_border = true

        --- Input Settings
        -- macOS Option Key is Meta
        ---@type table
        local possible_values = {
            both = "both",
            only_left = "only_left",
            only_right = "only_right",
            none = "none",
        }

        vim.g.neovide_input_macos_option_key_is_meta = possible_values.only_left
    end

    -- Grid size
    vim.opt.lines = 30
    vim.opt.columns = 120
end
