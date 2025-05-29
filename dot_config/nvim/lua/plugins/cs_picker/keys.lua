---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>fs",
        function()
            require("cs_picker").pick_colorscheme()
        end,
        mode = "n",
        { desc = "Pick colorscheme" },
    },
    {
        "<leader>cs",
        function()
            require("cs_picker").toggle_next()
        end,
        mode = "n",
        { desc = "Toggle colorscheme" },
    },
}

return keys
