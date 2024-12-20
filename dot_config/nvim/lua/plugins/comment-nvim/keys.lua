---@type LazyKeysSpec[]
local keys = {
    {
        "gc",
        mode = { "n", "x" },
        desc = "line comment",
    },
    {
        "gb",
        mode = { "n", "x" },
        desc = "block comment",
    },
    {
        "gcc",
        mode = "n",
        desc = "block comment",
    },
}

return keys
