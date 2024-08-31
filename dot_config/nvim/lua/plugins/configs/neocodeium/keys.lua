---@type LazyKeysSpec[]
local keys = {
    {
        "<A-f>",
        function()
            require("neocodeium").accept()
        end,
        mode = "i",
        desc = "",
    },
    {
        "<A-w>",
        function()
            require("neocodeium").accept_word()
        end,
        mode = "i",
        desc = "",
    },
    {
        "<A-a>",
        function()
            require("neocodeium").accept_line()
        end,
        mode = "i",
        desc = "",
    },
    {
        "<A-e>",
        function()
            require("neocodeium").cycle_or_complete()
        end,
        mode = "i",
        desc = "",
    },
    {
        "<A-r>",
        function()
            require("neocodeium").cycle_or_complete(-1)
        end,
        mode = "i",
        desc = "",
    },
    {
        "<A-c>",
        function()
            require("neocodeium").clear()
        end,
        mode = "i",
        desc = "",
    },
}

return keys
