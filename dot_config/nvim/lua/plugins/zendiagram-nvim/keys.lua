---@type LazyKeysSpec
local keys = {
    {
        "<Leader>e",
        function()
            require("zendiagram").open()
        end,
        mode = "n",
        desc = "Open diagnostics float",
        silent = true,
    },
}

return keys
