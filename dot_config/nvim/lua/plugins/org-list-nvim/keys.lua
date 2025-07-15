---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>lt",
        mode = "n",
        { silent = true, desc = "Cycle through list types for the current list" },
    },
    {
        "<C-Space>",
        mode = "n",
        { silent = true, desc = "Toggle checkbox state" },
    },
}

return keys
