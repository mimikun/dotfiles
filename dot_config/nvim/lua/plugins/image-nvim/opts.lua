---@type Options
local opts = {
    -- or backend = "ueberzug",
    backend = "kitty",
    -- or "magick_rock"
    processor = "magick_cli",
    integrations = {
        markdown = {
            enabled = true,
            clear_in_insert_mode = true,
            download_remote_images = true,
            only_render_image_at_cursor = true,
            -- "popup" or "inline", defaults to "popup"
            only_render_image_at_cursor_mode = "popup",
            floating_windows = false, -- if true, images will be rendered in floating markdown windows
            filetypes = { "markdown", "vimwiki" },
        },
        typst = {
            enabled = true,
            filetype = { "typst" },
        },
        neorg = {
            enabled = true,
            filetypes = { "norg" },
        },
    },
    max_width_window_percentage = nil,
    scale_factor = 1.0,
    kitty_method = "normal",
    -- toggles images when windows are overlapped
    window_overlap_clear_enabled = true,
    --window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    -- auto show/hide images when the editor gains/looses focus
    editor_only_render_when_focused = true,
    -- auto show/hide images in the correct Tmux window (needs visual-activity off)
    tmux_show_only_in_active_window = true,
    -- render image files as images when opened
    hijack_file_patterns = {
        "*.png",
        "*.jpg",
        "*.jpeg",
        "*.gif",
        "*.webp",
        "*.avif",
    },
    window_overlap_clear_ft_ignore = {
        "cmp_menu",
        "cmp_docs",
        "snacks_notif",
        "scrollview",
        "scrollview_sign",
    },
}

return opts
