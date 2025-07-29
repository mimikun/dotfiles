---@type LazyKeysSpec[]
local keys = {
    -- Global keymaps to open and close the plugin's main interface
    {
        "<leader>ro",
        function()
            require("rfcview").open_rfc()
        end,
        desc = "[R]FC [O]pen Main Window",
    },
    {
        "<leader>rc",
        function()
            require("rfcview").close_rfc()
        end,
        desc = "[R]FC [C]lose All Windows",
    },
}

return keys
