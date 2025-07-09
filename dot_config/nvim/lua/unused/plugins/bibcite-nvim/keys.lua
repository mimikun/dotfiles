---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>ci",
        ":CiteInsert<CR>",
        desc = "Insert citation",
    },
    {
        "<leader>cp",
        ":CitePeek<CR>",
        desc = "Peek citation info",
    },
    {
        "<leader>co",
        ":CiteOpen<CR>",
        desc = "Open citation file",
    },
    {
        "<leader>cn",
        ":CiteNote<CR>",
        desc = "Open citation note",
    },
}

return keys
