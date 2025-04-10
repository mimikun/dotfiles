---@type LazyKeysSpec[]
local keys = {
    {
        "<C-c><return>",
        mode = { "n", "i" },
        desc = "Generate commit message",
    },
    {
        "<C-c><C-m>",
        mode = { "n", "i" },
        desc = "Generate commit message",
    },
}

return keys
