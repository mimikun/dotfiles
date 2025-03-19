---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>se",
        function()
            require("scissors").editSnippet()
        end,
        mode = "n",
        { desc = "Snippet: Edit" },
    },
    {
        "<leader>sa",
        function()
            require("scissors").addNewSnippet()
        end,
        mode = { "n", "x" },
        { desc = "Snippet: Add" },
    },
}

return keys
