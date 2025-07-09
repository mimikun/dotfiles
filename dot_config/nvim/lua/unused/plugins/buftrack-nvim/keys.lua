---@type LazyKeysSpec[]
local keys = {
    {
        "<C-j>",
        function()
            require("buftrack").prev_buffer()
        end,
        mode = "n",
    },
    {
        "<C-k>",
        function()
            require("buftrack").next_buffer()
        end,
        mode = "n",
    },
}

return keys
