---@type table
local opts = {
    default = {
        use_absolute_path = require("config.global").is_windows,
        prompt_for_file_name = false,
        drag_and_drop = {
            enabled = true,
            insert_mode = true,
        },
    },
}

return opts
