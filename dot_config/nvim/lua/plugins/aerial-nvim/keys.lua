---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>a",
        function()
            require("aerial").toggle()
        end,
        desc = "Toggle aerial",
    },
}

return keys
