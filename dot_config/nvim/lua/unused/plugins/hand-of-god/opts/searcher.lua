---@type table
local searcher = {
    ignore = {
        "node_modules",
        "lib",
        "libs",
        "bin",
        "build",
    },
    -- instead of: a/veeeeery/laaaaaaarge/paaaaaath/tooooooo/file.lua
    -- you have:   a/v/l/p/t/file.lua
    -- 64 char length to contract
    contract_on_large_paths = true,
    case_sensitive = false,
}

return searcher
