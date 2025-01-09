local storage_path =
    table.concat({ vim.fn.stdpath("data"), "databases", "yanky.db" }, require("config.global").path_sep)

local opts = {
    ring = {
        storage = "sqlite",
        storage_path = storage_path,
        permanent_wrapper = require("yanky.wrappers").remove_carriage_return,
    },
    system_clipboard = {
        sync_with_ring = true,
        clipboard_register = nil,
    },
    preserve_cursor_position = {
        enabled = true,
    },
    textobj = {
        enabled = true,
    },
}

return opts
