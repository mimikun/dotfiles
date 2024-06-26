local M = {}

---@type table
local base_adapters = {
    -- TODO
}

-- NOTE: Include aaa
--[[
if not require("core.global").is_windows then
    table.insert(base_adapters, "")
end
]]

M.need_adapters = base_adapters

return M
