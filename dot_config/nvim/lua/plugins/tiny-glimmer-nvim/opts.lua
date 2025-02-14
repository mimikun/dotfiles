---@type table
local animations = {
    fade = "fade",
    reverse_fade = "reverse_fade",
    bounce = "bounce",
    left_to_right = "left_to_right",
    pulse = "pulse",
}

---@type table
local opts = {
    enabled = true,
    overwrite = {
        search = {
            enabled = false,
            default_animation = animations.pulse,
        },
        paste = {
            enabled = true,
            default_animation = animations.reverse_fade,
        },
        undo = {
            enabled = true,
            default_animation = {
                name = animations.fade,
            },
        },
        redo = {
            enabled = true,
            default_animation = {
                name = animations.fade,
            },
        },
    },
    default_animation = animations.fade,
    refresh_interval_ms = 6,
    transparency_color = vim.g.transparent_enabled,
}

return opts
