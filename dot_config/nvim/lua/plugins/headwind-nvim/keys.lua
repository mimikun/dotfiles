---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>hw",
        function()
            require("headwind").sort_tailwind_classes()
        end,
        mode = "n",
        desc = "Sort Tailwind classes",
        silent = true,
    },
    {
        "<leader>hw",
        function()
            require("headwind").sort_selection()
        end,
        mode = "v",
        desc = "Sort Tailwind classes in selection",
        silent = true,
    },
}

return keys
