---@type LazyKeysSpec[]
local keys = {
    {
        "K",
        function()
            require("hover").hover()
        end,
        mode = "n",
        desc = "hover.nvim",
    },
    {
        "gK",
        function()
            require("hover").hover_select()
        end,
        mode = "n",
        desc = "hover.nvim (select)",
    },
    {
        "<C-p>",
        function()
            require("hover").hover_switch("previous")
        end,
        mode = "n",
        desc = "hover.nvim (previous source)",
    },
    {
        "<C-n>",
        function()
            require("hover").hover_switch("next")
        end,
        mode = "n",
        desc = "hover.nvim (next source)",
    },
    -- Mouse support
    {
        "<MouseMove>",
        function()
            require("hover").hover_mouse()
        end,
        mode = "n",
        desc = "hover.nvim (mouse)",
    },
}

return keys
