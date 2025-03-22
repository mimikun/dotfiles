---@type LazyKeysSpec[]
local keys = {
    { "<leader>bn", "<Cmd>BufStackNext<CR>", mode = "n" },
    { "<leader>bp", "<Cmd>BufStackPrev<CR>", mode = "n" },
    { "<leader>bl", "<Cmd>BufStackList<CR>", mode = "n" },
    { "<leader>br", "<Cmd>BufReopen<CR>", mode = "n" },
}

return keys
