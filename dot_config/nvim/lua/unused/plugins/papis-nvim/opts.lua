---@type table
local db_path = table.concat({
    vim.fn.stdpath("data"),
    "papis_db",
    "papis-nvim.sqlite3",
}, require("config.global").path_sep)

---@type table
local init_filetypes = {
    "markdown",
    "norg",
    "yaml",
    "typst",
}

--@type table
local opts = {
    enable_keymaps = true,
    enable_fs_watcher = false,
    db_path = db_path,
    init_filetypes = init_filetypes,
}

return opts
