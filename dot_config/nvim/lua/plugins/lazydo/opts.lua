---@type LazyDoConfig
local opts = {
    pin_window = {
        -- "topright", "topleft", "bottomright", "bottomleft"
        position = "topright",
        -- Enable automatic synchronization with main window
        auto_sync = true,
    },
    storage = {
        -- Enable auto-detection of projects on startup
        startup_detect = false,
        -- Disable notifications when switching storage mode
        silent = false,
        -- Custom storage path (nil means use default)
        global_path = nil,
        auto_backup = true,
        backup_count = 1,
        compression = true,
        encryption = false,
    },
    views = {
        -- "list" or "kanban"
        default_view = "list",
    },
    theme = {
        border = "rounded",
        progress_bar = {
            width = 15,
            filled = "█",
            empty = "░",
            enabled = true,
            -- "classic", "modern", "minimal"
            style = "modern",
        },
        indent = {
            connector = "├─",
            last_connector = "└─",
        },
        task_separator = {
            left = "",
            right = "",
            center = "",
        },
    },
    icons = {
        task_pending = "",
        task_done = "",
        task_in_progress = "󱇻",
        task_blocked = "󰾕",
        priority = {
            low = "",
            medium = "󰻂",
            high = "",
            urgent = "󰀦",
        },
        created = "󰃰",
        updated = "󰇡",
        note = "󰎞",
        relations = "󱒖 ",
        due_date = "󰃭",
        metadata = "󰂵",
        kanban = {
            move_left = "",
            move_right = "",
            column = "",
            card = "󰆼",
            collapse = "▼",
            expand = "▶",
            task_status = {
                pending = "",
                done = "",
                in_progress = "",
                blocked = "",
            },
            card_actions = {
                edit = "",
                delete = "",
                add = "",
                move = "󰘕",
            },
            pagination = {
                prev = "«",
                next = "»",
                indicator = "•",
            },
        },
    },
    features = {
        folding = {
            enabled = true,
            default_folded = false,
            icons = {
                folded = "▶",
                unfolded = "▼",
            },
        },
    },
}

return opts
