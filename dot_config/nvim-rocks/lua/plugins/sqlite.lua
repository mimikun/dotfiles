local global = require("config.global")

if global.is_windows then
    vim.g.sqlite_clib_path = table.concat({ global.home, "utilities", "sqlite3.dll" }, "/")
end
