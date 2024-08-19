local ext = {
    backend = "file",
    flags = {
        catimg = { move = false },
        chafa = { move = false },
        viu = { move = false },
        -- cannot calculate terminal paddings adjust them yourselves
        ueberzug = { xmove = -12, ymove = -3, warnings = true, supress_backend_warning = false },
    },
    callbacks = {
        on_confirm_single = function(...)
            require("telescope._extensions.media.lib.canned").single.copy_path(...)
        end,
        on_confirm_muliple = function(...)
            require("telescope._extensions.media.lib.canned").multiple.bulk_copy(...)
        end,
    },
    cache_path = "/tmp/media",
    preview_title = "Preview",
    results_title = "Files",
    prompt_title = "Media",
    cwd = vim.fn.getcwd(),
    preview = {
        check_mime_type = true,
        timeout = 200,
        redraw = false,
        wait = 10,
        fill = {
            mime = "",
            file = "~",
            error = ":",
            binary = "X",
            timeout = "+",
            permission = "╱",
        },
    },
    log = {
        plugin = "telescope-media",
        level = "warn",
        highlights = true,
        use_file = true,
        use_quickfix = false,
    },
}

return ext
