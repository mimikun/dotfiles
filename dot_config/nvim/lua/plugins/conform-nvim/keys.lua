---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>f",
        function()
            require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
    },
}

return keys
