---@type table
local cmds = {
    "DialIncrement",
    "DialDecrement",
}

---@type LazyKeysSpec[]
local keys = {
    {
        "<C-a>",
        function()
            require("dial.map").manipulate("increment", "normal")
        end,
        mode = "n",
        desc = "normal mode increment",
    },
    {
        "<C-x>",
        function()
            require("dial.map").manipulate("decrement", "normal")
        end,
        mode = "n",
        desc = "normal mode decrement",
    },
    {
        "<C-a>",
        function()
            require("dial.map").manipulate("increment", "visual")
        end,
        mode = "v",
        desc = "visual mode increment",
    },
    {
        "<C-x>",
        function()
            require("dial.map").manipulate("decrement", "visual")
        end,
        mode = "v",
        desc = "visual mode decrement",
    },
    --[[
    {
        "g<C-a>",
        function()
            require("dial.map").manipulate("increment", "gnormal")
        end,
        mode = "gn",
        desc = "gnormal mode increment",
    },
    {
        "g<C-x>",
        function()
            require("dial.map").manipulate("decrement", "gnormal")
        end,
        mode = "gn",
        desc = "gnormal mode decrement",
    },
    {
        "g<C-a>",
        function()
            require("dial.map").manipulate("increment", "gvisual")
        end,
        mode = "gv",
        desc = "gvisual mode increment",
    },
    {
        "g<C-x>",
        function()
            require("dial.map").manipulate("decrement", "gvisual")
        end,
        mode = "gv",
        desc = "gvisual mode decrement",
    },
    ]]
}

---@type LazySpec
local spec = {
    "monaqa/dial.nvim",
    --lazy = false,
    cmd = cmds,
    keys = keys,
    event = "VeryLazy",
    --opts = {},
    --config = true,
    --cond = false,
}

return spec
