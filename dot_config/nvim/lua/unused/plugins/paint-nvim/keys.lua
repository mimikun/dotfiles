---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>p",
        ":Paint<CR>",
        mode = "v",
        { desc = "Paint selection" },
    },
    {
        "<leader>ps",
        ":PaintSelect<CR>",
        mode = "n",
        { desc = "Select paint brush" },
    },
    {
        "<leader>pc",
        ":PaintClear<CR>",
        mode = "n",
        { desc = "Clear paint" },
    },
}

return keys
