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
    "yamllint",
}

---@type table
need_linters = vim.list_extend(need_linters, base_linters)

-- NOTE: Include some linters, NOT Windows
if not require("config.global").is_windows then
    ---@type table
    need_linters = vim.list_extend(need_linters, not_windows)
end

table.sort(need_linters)

return need_linters
