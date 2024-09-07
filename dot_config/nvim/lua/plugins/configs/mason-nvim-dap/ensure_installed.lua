---@type table
local need_adapters = {
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

-- NOTE: Include DAP_ADAPTER_NAME in is_linux
if require("config.global").is_linux then
    table.insert(need_adapters, "bash")
    table.insert(need_adapters, "python")
end

return need_adapters
