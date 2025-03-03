---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>p",
        function()
            vim.cmd("PasteImage")
        end,
        desc = "Paste image from system clipboard",
    },
}

return keys
