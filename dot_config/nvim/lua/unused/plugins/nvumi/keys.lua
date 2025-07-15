---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>on",
        function()
            vim.cmd("Nvumi")
        end,
        mode = "n",
        desc = "[O]pen [N]vumi",
    },
}

return keys
