---@type LazyKeysSpec[]
local keys = {
    {
        "<C-CR>",
        function()
            require("in-and-out").in_and_out()
        end,
        mode = "i",
    },
}

return keys
