---@type LazySpec
local spec = {
    "kkharji/sqlite.lua",
    --lazy = false,
    config = function()
        if require("core.global").is_windows then
            vim.g.sqlite_clib_path = table.concat({ home, "utilities", "sqlite3.dll" }, "/")
        end
    end,
    --cond = false,
}

return spec
