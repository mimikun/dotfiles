---@type LazyKeysSpec[]
local keys = {
    {
        "<Leader>i",
        function()
            require("opposites").switch()
        end,
        desc = "Switch to opposite word",
    },
}

return keys
