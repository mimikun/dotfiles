---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>S",
        "<cmd>SidebarToggle<CR>",
        mode = "n",
        desc = "Toggle Sidebar",
        { noremap = true, silent = true },
    },
}

return keys
