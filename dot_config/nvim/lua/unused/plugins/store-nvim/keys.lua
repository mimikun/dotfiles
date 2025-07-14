---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>s",
        "<cmd>Store<cr>",
        function()
            require("store").open()
        end,
        mode = "n",
        desc = "Open Plugin Store",
    },
}

return keys
