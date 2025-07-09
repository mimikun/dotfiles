---@type table
local opts = {
    hint = "statusline-winbar",
    --hint = "floating-big-letter",
    picker_config = {
        handle_mouse_click = false,
        statusline_winbar_picker = {
            --use_winbar = "always",
            use_winbar = "never",
            --use_winbar = "smart",
        },
    },
    prompt_message = "Pick window: ",
    filter_rules = {
        autoselect_one = true,
        include_current_win = false,
        include_unfocusable_windows = false,
        bo = {
            filetype = {
                "NvimTree",
                "neo-tree",
                "notify",
                "snacks_notif",
            },
            buftype = {
                "terminal",
            },
        },
        wo = {},
        file_path_contains = {},
        file_name_contains = {},
    },
}

return opts
