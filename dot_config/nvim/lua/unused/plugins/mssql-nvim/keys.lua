---@type LazykeysSpec[]
local keys = {
    {
        "<leader>dn",
        function()
            require("mssql").new_query()
        end,
        mode = "n",
        --desc = "New Query",
        desc = "Open a new buffer for sql queries",
    },
    {
        "<leader>dc",
        function()
            require("mssql").connect()
        end,
        mode = "n",
        --desc = "Connect",
        desc = "Connect the current buffer (you'll be prompted to choose a connection)",
    },
    {
        "<leader>dq",
        function()
            require("mssql").disconnect()
        end,
        mode = "n",
        --desc = "Disconnect",
        desc = "Disconnects the current buffer",
    },
    {
        "<leader>dx",
        function()
            require("mssql").execute_query()
        end,
        mode = "n",
        --desc = "Execute Query",
        desc = "Execute the selection, or the whole buffer",
    },
    {
        "<leader>de",
        function()
            require("mssql").edit_connections()
        end,
        mode = "n",
        --desc = "Edit Connections",
        desc = "Open the [connections file](#Connections-json-file) for editing",
    },
    {
        "<leader>dr",
        function()
            require("mssql").refresh_intellisense_cache()
        end,
        mode = "n",
        --desc = "Refresh Intellisense",
        desc = "Rebuild the intellisense cache",
    },
    {
        "<leader>dd",
        function()
            require("mssql").new_default_query()
        end,
        mode = "n",
        --desc = "New Default Query",
        desc = "Look for the connection called `default`, prompt to choose a database in that server, connect to that database and open a new buffer for querying (very useful!)",
    },
}

return keys
