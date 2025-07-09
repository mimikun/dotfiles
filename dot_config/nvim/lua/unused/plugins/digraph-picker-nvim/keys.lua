---@type LazyKeysSpec[]
local keys = {
    {
        "<C-k><C-k>",
        function()
            require("digraph-picker").insert_digraph()
        end,
        mode = "i",
        { noremap = true, silent = true, desc = "Digraph picker" },
    },
}

return keys
