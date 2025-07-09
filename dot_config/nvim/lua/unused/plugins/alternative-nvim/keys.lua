---@type LazyKeysSpec[]
local keys = {
    {
        "<C-.",
        function()
            require("alternative").alternate("forward")
        end,
        mode = "n",
        desc = "Trigger alternative rule in forward direction",
    },
    {
        "<C-,>",
        function()
            require("alternative").alternate("backward")
        end,
        mode = "n",
        desc = "Trigger alternative rule in backward direction",
    },
}

return keys
