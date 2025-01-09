---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>h",
        ":HopWord<CR>",
        mode = "n",
        { silent = true },
        desc = "HopWord",
    },
}

return keys
