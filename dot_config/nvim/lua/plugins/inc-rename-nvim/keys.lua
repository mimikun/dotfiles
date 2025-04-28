---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>rn",
        ":IncRename ",
        mode = "n",
    },
    {
        "<leader>rn",
        function()
            return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        mode = "n",
        { expr = true },
    },
}

return keys
