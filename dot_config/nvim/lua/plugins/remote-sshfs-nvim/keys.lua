---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>rc",
        function()
            require("remote-sshfs.api").connect()
        end,
        mode = "n",
    },
    {
        "<leader>rd",
        function()
            require("remote-sshfs.api").disconnect()
        end,
        mode = "n",
    },
    {
        "<leader>re",
        function()
            require("remote-sshfs.api").edit()
        end,
        mode = "n",
    },
}

return keys
