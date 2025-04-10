---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>-",
        ":Triptych<CR>",
        mode = "n",
        { silent = true, desc = "Toggle Triptych" },
    },
}

return keys
