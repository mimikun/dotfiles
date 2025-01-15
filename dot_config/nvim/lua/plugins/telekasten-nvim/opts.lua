local global = require("config.global")
local path_sep = global.path_sep

local base_path = vim.fn.expand("$zettelkasten_root")
local templates_path = table.concat({ base_path, "templates" }, path_sep)

local opts = {
    home = base_path,
    dailies = base_path,
    weeklies = base_path,
    templates = base_path,
    template_new_note = table.concat({ templates_path, "basenote.md" }, path_sep),
    template_new_daily = table.concat({ templates_path, "daily.md" }, path_sep),
    template_new_weekly = table.concat({ templates_path, "weekly.md" }, path_sep),
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
