---@type table
local need_linters = {
    "selene",
}

-- NOTE: Include LINTER_NAME
--[[
if not require("config.global").is_windows then
    table.insert(need_linters, "")
end
]]

return need_linters
