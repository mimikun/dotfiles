---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>/",
        function()
            require("commentless").toggle()
        end,
        mode = "n",
        desc = "Toggle Comments",
    },
}

return keys
