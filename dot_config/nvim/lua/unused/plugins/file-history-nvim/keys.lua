---@type LazyKeysSpec
local keys = {
    {
        "<leader>Bb",
        function()
            require("file_history").backup()
        end,
        mode = "n",
        silent = true,
        desc = "named backup for file",
    },
    {
        "<leader>Bh",
        function()
            require("file_history").history()
        end,
        mode = "n",
        silent = true,
        desc = "local history of file",
    },
    {
        "<leader>Bf",
        function()
            require("file_history").files()
        end,
        mode = "n",
        silent = true,
        desc = "local history files in repo",
    },
    {
        "<leader>Bq",
        function()
            require("file_history").query()
        end,
        mode = "n",
        silent = true,
        desc = "local history query",
    },
}

return keys
