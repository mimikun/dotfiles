local global = require("config.global")

---@type table
local need_linters = {}

---@type table
local base_linters = {
    -- fish
    "selene",
    "textlint",
}

---@type table
local not_windows = {
    base = {
        "yamllint",
    },
}

---@type table
need_linters = vim.list_extend(need_linters, base_linters)

-- NOTE: Include some linters, NOT Windows
if not global.is_windows then
    -- NOTE: Include some linters, NOT Work
    if not global.is_work then
        ---@type table
        need_linters = vim.list_extend(need_linters, not_windows.base)
    end
end

table.sort(need_linters)

return need_linters
