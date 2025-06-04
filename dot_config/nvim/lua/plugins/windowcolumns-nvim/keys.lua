---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>wv",
        function()
            require("windowcolumns").create_column()
        end,
    },
    {
        "<leader>wh",
        function()
            require("windowcolumns").move_column("left")
        end,
    },
    {
        "<leader>wl",
        function()
            require("windowcolumns").move_column("right")
        end,
    },
    {
        "<leader>wj",
        function()
            require("windowcolumns").move_window("down")
        end,
    },
    {
        "<leader>wk",
        function()
            require("windowcolumns").move_window("up")
        end,
    },
    {
        "<leader>Wh",
        function()
            require("windowcolumns").move_window("left")
        end,
    },
    {
        "<leader>Wl",
        function()
            require("windowcolumns").move_window("right")
        end,
    },
}

return keys
