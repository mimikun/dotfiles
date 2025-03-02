---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>lms",
        vim.cmd(":LiveMDStart<CR>"),
        mode = "n",
        { noremap = true, silent = true },
    },
    {
        "<leader>lmx",
        vim.cmd(":LiveMDStop<CR>"),
        mode = "n",
        { noremap = true, silent = true },
    },
}

return keys
