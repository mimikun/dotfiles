---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>e",
        function()
            require("netria").toggle()
        end,
        mode = "n",
        { desc = "Toggle Netria" },
    },
}

return keys
