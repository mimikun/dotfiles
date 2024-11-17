---@type table
local cmds = {
    "PasteImage",
    "ImgClipDebug",
    "ImgClipConfig",
}

---@type table
local opts = {
    -- recommended settings
    default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = {
            insert_mode = true,
        },
        -- if windows, true
        use_absolute_path = require("config.global").is_windows,
    },
}

---@type LazySpec
local spec = {
    "HakonHarnes/img-clip.nvim",
    --lazy = false,
    cmd = cmds,
    --keys = "",
    event = "VeryLazy",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
