---@type LazyKeysSpec[]
local keys = {
    -- jumper
    {
        "<leader>a",
        function()
            require("handofgod.jumper").add()
        end,
        mode = "n",
        desc = "add file to jumper list",
    },
    {
        "<leader>e",
        function()
            require("handofgod.jumper"):explore()
        end,
        mode = "n",
        desc = "explore jumper list as buffer",
    },
    {
        "<C-h>",
        function()
            require("handofgod.jumper").jump_to(1)
        end,
        mode = "n",
        desc = "jump to 1",
    },
    {
        "<C-j>",
        function()
            require("handofgod.jumper").jump_to(2)
        end,
        mode = "n",
        desc = "jump to 2",
    },
    {
        "<C-k>",
        function()
            require("handofgod.jumper").jump_to(3)
        end,
        mode = "n",
        desc = "jump to 3",
    },
    {
        "<C-l>",
        function()
            require("handofgod.jumper").jump_to(4)
        end,
        mode = "n",
        desc = "jump to 4",
    },
    -- file explorer/manager"
    {
        "<C-e>",
        function()
            require("handofgod.manager"):open()
        end,
        mode = "n",
        desc = "hands-of-god file explorer/manager",
    },
    -- searcher
    {
        "<C-p>",
        function()
            require("handofgod.searcher"):open()
        end,
        mode = "n",
        desc = "hand-of-god searcher",
    },
    -- finder
    {
        "<C-f>",
        function()
            require("handofgod.finder"):open()
        end,
        mode = "n",
        desc = "hand-of-god finder",
    },
}

return keys
