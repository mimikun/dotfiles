---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>hh",
        function()
            require("header").add_headers()
        end,
        mode = "n",
    },
    {
        "<leader>hm",
        function()
            require("header").add_license_header("mit")
        end,
        mode = "n",
    },
}

return keys
