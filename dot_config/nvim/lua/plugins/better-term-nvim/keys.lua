---@type LazyKeysSpec[]
local keys = {
    {
        mode = { "n", "t" },
        "<C-;>",
        function()
            require("betterTerm").open()
        end,
        desc = "Open BetterTerm 0",
    },
    {
        "<leader>tt",
        function()
            require("betterTerm").select()
        end,
        desc = "Select terminal",
    },
}

return keys
