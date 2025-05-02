---@type LazyKeysSpec[]
local keys = {
    { "<leader>cs", mode = "n", desc = "Open prompt for words to colorize" },
    { "<leader>cc", mode = "n", desc = "Clear all highlighted words" },
    { "<leader>cn", mode = "n", desc = "Add a new word to existing highlights" },
    { "<leader>ca", mode = "n", desc = "Add word under cursor to existing highlights" },
}

return keys
