local M = {}

---@type table
local base_adapters = {
    "python",
    --"cppdbg",
    --"delve",
    --"node2",
    --"chrome",
    --"firefox",
    --"php",
    --"coreclr",
    --"js",
    --"codelldb",
    --"bash",
    --"javadbg",
    --"javatest",
    --"mock",
    --"puppet",
    --"elixir",
    --"kotlin",
    --"dart",
    --"haskell",
}

-- NOTE: Include DAP_ADAPTER_NAME
--[[
if not require("core.global").is_windows then
    table.insert(base_adapters, "")
end
]]

M.need_adapters = base_adapters

return M
