---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>tt",
        function()
            require("time-machine").actions.toggle()
        end,
        mode = "n",
        desc = "[Time Machine] Toggle Tree",
    },
    {
        "<leader>tx",
        function()
            require("time-machine").actions.purge_current()
        end,
        mode = "n",
        desc = "[Time Machine] Purge current",
    },
    {
        "<leader>tX",
        function()
            require("time-machine").actions.purge_all()
        end,
        mode = "n",
        desc = "[Time Machine] Purge all",
    },
}

return keys
