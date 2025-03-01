---@type table
local mode_ic = { "i", "c" }

-- Define your keybinds
---@type LazyKeysSpec
local keys = {
    {
        "<M-b>",
        function()
            require("backout").back()
        end,
        mode_ic,
    },
    {
        "<M-n>",
        function()
            require("backout").next()
        end,
        mode_ic,
    },
}

return keys
