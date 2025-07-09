---@type LazyKeysSpec[]
local keys = {
    { "g?p", mode = "n", desc = "Plain debug" },
    { "g?P", mode = "n", desc = "Plain debug" },
    { "g?v", mode = "n", desc = "Variable debug" },
    { "g?V", mode = "n", desc = "Variable debug" },
    { "g?sp", mode = "n", desc = "Plain debug" },
    { "g?sv", mode = "n", desc = "Variable debug" },
    { "C-G-p", mode = "i", desc = "Plain debug" },
    { "C-G-v", mode = "i", desc = "Variable debug (always prompt for variable)" },
    { "g?v", mode = "v", desc = "Variable debug" },
    { "g?V", mode = "v", desc = "Variable debug" },
    { "g?o", desc = "Variable debug" },
    { "g?O", desc = "Variable debug" },
    { "g?so", desc = "Variable debug" },
}

return keys
