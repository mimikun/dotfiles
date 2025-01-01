---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>q",
        function()
            require("quicker").toggle()
        end,
        mode = "n",
        desc = "Toggle quickfix",
    },
    {
        "<leader>l",
        function()
            require("quicker").toggle({ loclist = true })
        end,
        desc = "Toggle loclist",
        mode = "n",
    },
}

return keys
