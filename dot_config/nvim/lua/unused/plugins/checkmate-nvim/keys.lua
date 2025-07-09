---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>Tn",
        "<cmd>CheckmateCreate<CR>",
        mode = "n",
        { desc = "Create todo item" },
    },
    {
        "<leader>Tt",
        "<cmd>CheckmateToggle<CR>",
        mode = "n",
        { desc = "Toggle todo item" },
    },
    {
        "<leader>Td",
        "<cmd>CheckmateCheck<CR>",
        mode = "n",
        { desc = "Set todo item as checked (done)" },
    },
    {
        "<leader>Tu",
        "<cmd>CheckmateUncheck<CR>",
        mode = "n",
        { desc = "Set todo item as unchecked (not done)" },
    },
}

return keys
