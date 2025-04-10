---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>oc",
        ":CursorOpen<CR>",
        mode = "n",
        desc = "[O]pen in [C]ursor",
        { noremap = true, silent = true },
    },
    {
        "<leader>oC",
        ":CursorOpen!<CR>",
        mode = "n",
        desc = "[O]pen in [C]ursor (new window)",
        { noremap = true, silent = true },
    },
}

return keys
