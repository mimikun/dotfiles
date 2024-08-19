local global = require("config.global")

---@type LazySpec
local spec = {
    "kkharji/sqlite.lua",
    --lazy = false,
    config = function()
        if global.is_windows then
            vim.g.sqlite_clib_path = table.concat({ global.home, "utilities", "sqlite3.dll" }, "/")
        end
    end,
    --cond = false,
}

return spec
