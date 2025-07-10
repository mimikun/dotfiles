---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>lms",
        function()
            vim.cmd("LiveMDStart")
        end,
        mode = "n",
        { noremap = true, silent = true },
    },
    {
        "<leader>lmx",
        function()
            vim.cmd("LiveMDStop")
        end,
        mode = "n",
        { noremap = true, silent = true },
    },
}

return keys
