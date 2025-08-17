---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>s",
        function()
            require("store").open()
        end,
        mode = "n",
        desc = "Open Plugin Store",
    },
}

return keys
