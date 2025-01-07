local global = require("config.global")
local path_sep = "/"

local base_path = global.is_windows and table.concat({ "C:", "Users", "USER_NAME", "zettelkasten" }, path_sep)
    or vim.fn.expand("~/zettelkasten")

local opts = {
    home = base_path,
    dailies = base_path,
    weeklies = base_path,
    templates = base_path,
    template_new_note = base_path .. path_sep .. "templates" .. path_sep .. "basenote.md",
    template_new_daily = base_path .. path_sep .. "templates" .. path_sep .. "daily.md",
    template_new_weekly = base_path .. path_sep .. "templates" .. path_sep .. "weekly.md",
    image_subdir = "img",
    extension = ".md",
    new_note_filename = "title-uuid",
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,
    journal_auto_open = false,
    image_link_style = "markdown",
    sort = "filename",
    install_syntax = true,
    tag_notation = "#tag",
    subdirs_in_links = true,
    command_palette_theme = "ivy",
    show_tags_theme = "ivy",
    media_previewer = "telescope-media-files",
    media_extensions = {
        ".png",
        ".jpg",
        ".bmp",
        ".gif",
        ".pdf",
        ".mp4",
        ".webm",
        ".webp",
        ".svg",
    },
    plug_into_calendar = true,
    calendar_opts = {
        -- 1 -> `WK01`
        -- 2 -> `WK 1`
        -- 3 -> `KW01`
        -- 4 -> `KW 1`
        -- 5 -> `1`
        weeknm = 4,

        calendar_monday = 0,
        calendar_mark = "left-fit",
    },

    -- TODO: xsel, xclip, wl-paste, osascript
    clipboard_program = global.is_wsl and "wl-paste" or "xclip",
}

return opts
