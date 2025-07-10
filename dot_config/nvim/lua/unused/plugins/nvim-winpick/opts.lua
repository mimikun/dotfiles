---@type table
local opts = {
    filter_rules = {
        -- If there's only one window to choose after filtering, immediately pick it
        autoselect_one = true,
        -- Include the currently focused window
        include_current_win = true,
        -- Include windows that cannot be focused
        include_unfocusable_windows = false,
        -- Bufferoptions that should be filtered on
        bo = {
            filetype = {
                "NvimTree",
                "neo-tree",
                "notify",
                "snacks_notif",
            },
            buftype = {
                "terminal",
                "nofile",
                "prompt",
            },
        },
        file_path_contains = {},
        file_name_contains = {},
    },
    hint = "floating-big-letter",
    --hint = "floating-letter",

    multiselect = {
        -- Not set by default, character that triggers a multiselect (if available on the action)
        --trigger_char = "m",
        -- Not set by default, character that triggers a commit of the selected windows (if available on the action)
        --commit_char = "c",
    },
}

return opts
