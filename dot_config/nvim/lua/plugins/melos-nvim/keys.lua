---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>mr",
        "<Cmd>MelosRun<CR>",
        mode = "n",
        { desc = "Run Melos script" },
    },
    {
        "<leader>me",
        "<Cmd>MelosEdit<CR>",
        mode = "n",
        { desc = "Edit Melos script in melos.yaml" },
    },
    {
        "<leader>mo",
        "<Cmd>MelosOpen<CR>",
        mode = "n",
        { desc = "Open melos.yaml" },
    },
}

return keys
