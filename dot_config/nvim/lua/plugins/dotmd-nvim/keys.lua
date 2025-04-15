---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>nc",
        function()
            require("dotmd").create_note()
        end,
        desc = "[DotMd] Create new note",
    },
    {
        "<leader>nt",
        function()
            require("dotmd").create_todo_today()
        end,
        desc = "[DotMd] Create todo for today",
    },
    {
        "<leader>ni",
        function()
            require("dotmd").inbox()
        end,
        desc = "[DotMd] Inbox",
    },
    {
        "<leader>nj",
        function()
            require("dotmd").create_journal()
        end,
        desc = "[DotMd] Create journal",
    },
    {
        "<leader>np",
        function()
            require("dotmd").navigate("previous")
        end,
        desc = "[DotMd] Navigate to previous todo",
    },
    {
        "<leader>nn",
        function()
            require("dotmd").navigate("next")
        end,
        desc = "[DotMd] Navigate to next todo",
    },
    {
        "<leader>no",
        function()
            require("dotmd").open({
                pluralise_query = true, -- recommended
            })
        end,
        desc = "[DotMd] Open",
    },
    {
        "<leader>sna",
        function()
            require("dotmd").pick()
        end,
        desc = "[DotMd] Everything",
    },
    {
        "<leader>snA",
        function()
            require("dotmd").pick({
                grep = true,
            })
        end,
        desc = "[DotMd] Search everything grep",
    },
    {
        "<leader>snn",
        function()
            require("dotmd").pick({
                type = "notes",
            })
        end,
        desc = "[DotMd] Search notes",
    },
    {
        "<leader>snN",
        function()
            require("dotmd").pick({
                type = "notes",
                grep = true,
            })
        end,
        desc = "[DotMd] Search notes grep",
    },
    {
        "<leader>snt",
        function()
            require("dotmd").pick({
                type = "todos",
            })
        end,
        desc = "[DotMd] Search todos",
    },
    {
        "<leader>snT",
        function()
            require("dotmd").pick({
                type = "todos",
                grep = true,
            })
        end,
        desc = "[DotMd] Search todos grep",
    },
    {
        "<leader>snj",
        function()
            require("dotmd").pick({
                type = "journals",
            })
        end,
        desc = "[DotMd] Search journal",
    },
    {
        "<leader>snJ",
        function()
            require("dotmd").pick({
                type = "journals",
                grep = true,
            })
        end,
        desc = "[DotMd] Search journal grep",
    },
}

return keys
