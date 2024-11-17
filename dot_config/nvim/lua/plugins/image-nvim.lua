local global = require("config.global")

---@type string|nil
local backend
--backend = global.is_mac and "kitty" or "ueberzug"
backend = "kitty"

---@type LazySpec[]
local dependencies = {
    "leafo/magick",
}

---@type table
local opts = {
    backend = backend,
    processor = "magick_cli",
    integrations = {
        markdown = {
            enabled = true,
            clear_in_insert_mode = true,
            download_remote_images = true,
            only_render_image_at_cursor = true,
            filetypes = { "markdown", "vimwiki" },
        },
        html = {
            enabled = false,
        },
        css = {
            enabled = false,
        },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
    kitty_method = "normal",
    -- toggles images when windows are overlapped
    window_overlap_clear_enabled = true,
    --window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    -- auto show/hide images when the editor gains/looses focus
    editor_only_render_when_focused = true,
    -- auto show/hide images in the correct Tmux window (needs visual-activity off)
    tmux_show_only_in_active_window = true,
    -- render image files as images when opened
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
}

---@type LazySpec
local spec = {
    "3rd/image.nvim",
    build = false,
    lazy = false,
    --dependencies = dependencies,
    config = function()
        require("image").setup(opts)
    end,
    --cond = false,
    --enabled = false,
}

return spec
