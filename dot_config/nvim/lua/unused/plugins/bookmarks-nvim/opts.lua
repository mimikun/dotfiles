---@type string
local db_dir = vim.fn.stdpath("data")

---@type string
local backup_dir = table.concat({ db_dir, "bookmarks.backup" }, require("config.global").path_sep)

---@type Bookmarks.Config
local opts = {
    db_dir = db_dir,
    backup = {
        enabled = true,
        dir = backup_dir,
    },
}

return opts
