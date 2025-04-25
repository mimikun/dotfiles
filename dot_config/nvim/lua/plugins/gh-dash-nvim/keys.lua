---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>cc",
        function()
            require("gh_dash").toggle()
        end,
        desc = "Toggle gh-dash popup",
    },
}

return keys
