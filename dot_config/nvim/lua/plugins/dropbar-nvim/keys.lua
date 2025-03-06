---@type LazyKeysSpec[]
local keys = {
    {
        "<Leader>;",
        function()
            require("dropbar.api").pick()
        end,
        mode = "n",
        desc = "Pick symbols in winbar",
    },
    {
        "[;",
        function()
            require("dropbar.api").goto_context_start()
        end,
        mode = "n",
        desc = "Go to start of current context",
    },
    {
        "];",
        function()
            require("dropbar.api").select_next_context()
        end,
        mode = "n",
        desc = "Select next context",
    },
}

return keys
