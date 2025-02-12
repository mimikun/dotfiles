---@type table
local opts = {
    default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = {
            insert_mode = true,
        },
        use_absolute_path = require("config.global").is_windows,
    },
}

return opts
