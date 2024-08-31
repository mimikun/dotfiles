---@type table
local ignore_formatters = {
    "selene",
}

-- NOTE: Include LINTER_NAME
--[[
if not require("config.global").is_windows then
    table.insert(ignore_formatters, "")
end
]]

return ignore_formatters
