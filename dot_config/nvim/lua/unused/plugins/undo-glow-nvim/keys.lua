---@type LazyKeysSpec[]
local keys = {
    {
        "u",
        function()
            require("undo-glow").undo()
        end,
        mode = "n",
        desc = "Undo with highlight",
        noremap = true,
    },
    {
        "U",
        function()
            require("undo-glow").redo()
        end,
        mode = "n",
        desc = "Redo with highlight",
        noremap = true,
    },
    {
        "p",
        function()
            require("undo-glow").paste_below()
        end,
        mode = "n",
        desc = "Paste below with highlight",
        noremap = true,
    },
    {
        "P",
        function()
            require("undo-glow").paste_above()
        end,
        mode = "n",
        desc = "Paste above with highlight",
        noremap = true,
    },
    {
        "n",
        function()
            require("undo-glow").search_next({
                animation = {
                    animation_type = "strobe",
                },
            })
        end,
        mode = "n",
        desc = "Search next with highlight",
        noremap = true,
    },
    {
        "N",
        function()
            require("undo-glow").search_prev({
                animation = {
                    animation_type = "strobe",
                },
            })
        end,
        mode = "n",
        desc = "Search prev with highlight",
        noremap = true,
    },
    {
        "*",
        function()
            require("undo-glow").search_star({
                animation = {
                    animation_type = "strobe",
                },
            })
        end,
        mode = "n",
        desc = "Search star with highlight",
        noremap = true,
    },
    {
        "#",
        function()
            require("undo-glow").search_hash({
                animation = {
                    animation_type = "strobe",
                },
            })
        end,
        mode = "n",
        desc = "Search hash with highlight",
        noremap = true,
    },
    {
        "gc",
        function()
            -- This is an implementation to preserve the cursor position
            local pos = vim.fn.getpos(".")
            vim.schedule(function()
                vim.fn.setpos(".", pos)
            end)
            return require("undo-glow").comment()
        end,
        mode = { "n", "x" },
        desc = "Toggle comment with highlight",
        expr = true,
        noremap = true,
    },
    {
        "gc",
        function()
            require("undo-glow").comment_textobject()
        end,
        mode = "o",
        desc = "Comment textobject with highlight",
        noremap = true,
    },
    {
        "gcc",
        function()
            return require("undo-glow").comment_line()
        end,
        mode = "n",
        desc = "Toggle comment line with highlight",
        expr = true,
        noremap = true,
    },
}

return keys
