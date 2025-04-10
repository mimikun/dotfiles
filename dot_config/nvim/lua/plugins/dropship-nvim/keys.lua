---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>dt",
        function() -- creates a new tab, then uses `:tcd`
            require("dropship").new_tab()
        end,
        mode = "n",
        desc = "[D]ropship in a new [T]ab",
    },
    {
        "<leader>dh",
        function() -- uses `:tcd` on current tab
            require("dropship").current_tab()
        end,
        mode = "n",
        desc = "[D]ropship right [H]ere",
    },
    {
        "<leader>dg",
        function() -- uses `:cd`
            require("dropship").globally()
        end,
        mode = "n",
        desc = "[D]ropship [G]lobally",
    },
}

return keys
