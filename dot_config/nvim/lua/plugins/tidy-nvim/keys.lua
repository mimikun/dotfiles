---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>tt",
        function()
            require("tidy").toggle()
        end,
        mode = "n",
        desc = "Turn tidy.nvim off for the current buffer",
    },
    {
        "<leader>tr",
        function()
            require("tidy").run()
        end,
        mode = "n",
        desc = "Run the formatting functionality of tidy.nvim off without saving",
    },
}

return keys
