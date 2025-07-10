---@type LazyKeysSpec[]
local keys = {
    {
        "gf",
        function()
            require("pathfinder").gf()
        end,
        mode = "n",
        silent = true,
        desc = "Enhanced go to file",
    },
    {
        "gF",
        function()
            require("pathfinder").gF()
        end,
        mode = "n",
        silent = true,
        desc = "Enhanced go to file (line)",
    },
    {
        "gx",
        function()
            require("pathfinder").gx()
        end,
        mode = "n",
        silent = true,
        desc = "Open URL/Git repository",
    },
    {
        "]f",
        function()
            require("pathfinder").next_file()
        end,
        mode = "n",
        silent = true,
        desc = "Jump to next valid file name",
    },
    {
        "[f",
        function()
            require("pathfinder").prev_file()
        end,
        mode = "n",
        silent = true,
        desc = "Jump to previous valid file name",
    },
    {
        "]u",
        function()
            require("pathfinder").next_url()
        end,
        mode = "n",
        silent = true,
        desc = "Jump to next valid URL",
    },
    {
        "[u",
        function()
            require("pathfinder").prev_url()
        end,
        mode = "n",
        silent = true,
        desc = "Jump to previous valid URL",
    },
    {
        "<leader>gf",
        function()
            require("pathfinder").select_file()
        end,
        mode = "n",
        silent = true,
        desc = "Visual file selection",
    },
    {
        "<leader>gF",
        function()
            require("pathfinder").select_file_line()
        end,
        mode = "n",
        silent = true,
        desc = "Visual file selection (line)",
    },
    {
        "<leader>gx",
        function()
            require("pathfinder").select_url()
        end,
        mode = "n",
        silent = true,
        desc = "Visual URL/Git repository selection",
    },
    {
        "<leader>h",
        function()
            require("pathfinder").hover_description()
        end,
        mode = "n",
        noremap = true,
        silent = true,
        desc = "Pathfinder: Hover",
    },
}

return keys
