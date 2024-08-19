---@type table
local need_adapters = {
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
if not require("config.global").is_windows then
    table.insert(need_adapters, "bash")
end

return need_adapters
