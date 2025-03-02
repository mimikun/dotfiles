---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>on",
        vim.cmd("Nvumi"),
        mode = "n",
        desc = "[O]pen [N]vumi",
    },
}

return keys
