---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>oC",
        function()
            require("orgcheckbox").toggle_checkbox()
        end,
        mode = "n",
        { desc = "org toggle checkbox", silent = true },
    },
}

return keys
