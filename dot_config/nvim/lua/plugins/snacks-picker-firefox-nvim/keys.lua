---@type LazyKeysSpec
local keys = {
    {
        "<leader>Ff",
        function()
            require("snacks").picker.firefox_search()
        end,
        mode = "n",
        silent = true,
        desc = "Firefox search",
    },
    {
        "<leader>Fb",
        function()
            require("snacks").picker.firefox_bookmarks()
        end,
        mode = "n",
        silent = true,
        desc = "Firefox bookmarks",
    },
    {
        "<leader>Fh",
        function()
            require("snacks").picker.firefox_history()
        end,
        mode = "n",
        silent = true,
        desc = "Firefox history",
    },
}

return keys
