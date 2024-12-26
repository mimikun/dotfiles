---@type LazyKeysSpec[]
local keys = {
    -- Normal and Visual maps
    {
        "<up>",
        function()
            require("multicursor-nvim").lineAddCursor(-1)
        end,
        mode = { "n", "v" },
        desc = "Add cursor above/below the main cursor",
    },
    {
        "<down>",
        function()
            require("multicursor-nvim").lineAddCursor(1)
        end,
        mode = { "n", "v" },
        desc = "Add cursor above/below the main cursor",
    },
    {
        "<leader><up>",
        function()
            require("multicursor-nvim").lineSkipCursor(-1)
        end,
        mode = { "n", "v" },
        desc = "Skip cursor above/below the main cursor",
    },
    {
        "<leader><down>",
        function()
            require("multicursor-nvim").lineSkipCursor(1)
        end,
        mode = { "n", "v" },
        desc = "Skip cursor above/below the main cursor",
    },
    {
        "<leader>n",
        function()
            require("multicursor-nvim").matchAddCursor(1)
        end,
        mode = { "n", "v" },
        desc = "Add adding a new cursor by matching word/selection",
    },
    {
        "<leader>s",
        function()
            require("multicursor-nvim").matchSkipCursor(1)
        end,
        mode = { "n", "v" },
        desc = "Skip adding a new cursor by matching word/selection",
    },
    {
        "<leader>N",
        function()
            require("multicursor-nvim").matchAddCursor(-1)
        end,
        mode = { "n", "v" },
        desc = "Add adding a new cursor by matching word/selection",
    },
    {
        "<leader>S",
        function()
            require("multicursor-nvim").matchSkipCursor(-1)
        end,
        mode = { "n", "v" },
        desc = "Skip adding a new cursor by matching word/selection",
    },
    {
        "<leader>A",
        function()
            require("multicursor-nvim").matchAllAddCursors()
        end,
        mode = { "n", "v" },
        desc = "Add all matches in the document",
    },
    {
        "<left>",
        function()
            require("multicursor-nvim").nextCursor()
        end,
        mode = { "n", "v" },
        desc = "Rotate the main cursor",
    },
    {
        "<right>",
        function()
            require("multicursor-nvim").prevCursor()
        end,
        mode = { "n", "v" },
        desc = "Rotate the main cursor",
    },
    {
        "<leader>x",
        function()
            require("multicursor-nvim").deleteCursor()
        end,
        mode = { "n", "v" },
        desc = "Delete the main cursor",
    },
    {
        "<c-q>",
        function()
            require("multicursor-nvim").toggleCursor()
        end,
        mode = { "n", "v" },
        desc = "Easy way to add and remove cursors using the main cursor",
    },
    {
        "<leader><c-q>",
        function()
            require("multicursor-nvim").duplicateCursors()
        end,
        mode = { "n", "v" },
        desc = "Clone every cursor and disable the originals",
    },
    {
        "<c-i>",
        function()
            require("multicursor-nvim").jumpForward()
        end,
        mode = { "n", "v" },
        desc = "Jumplist support",
    },
    {
        "<c-o>",
        function()
            require("multicursor-nvim").jumpBackward()
        end,
        mode = { "n", "v" },
        desc = "Jumplist support",
    },
    -- Normal mode maps
    {
        "<c-leftmouse>",
        function()
            require("multicursor-nvim").handleMouse()
        end,
        mode = "n",
        desc = "Add and remove cursors with control + left click",
    },
    {
        "<esc>",
        function()
            if not require("multicursor-nvim").cursorsEnabled() then
                require("multicursor-nvim").enableCursors()
            elseif require("multicursor-nvim").hasCursors() then
                require("multicursor-nvim").clearCursors()
            end
        end,
        mode = "n",
    },
    {
        "<leader>gv",
        function()
            require("multicursor-nvim").restoreCursors()
        end,
        mode = "n",
        desc = "bring back cursors if you accidentally clear them",
    },
    {
        "<leader>a",
        function()
            require("multicursor-nvim").alignCursors()
        end,
        mode = "n",
        desc = "Align cursor columns",
    },
    -- Visual mode maps
    -- HACK: Disabled to prevent unintended behavior
    --[[
    {
        "S",
        function()
            require("multicursor-nvim").splitCursors()
        end,
        mode = "v",
        desc = "Split visual selections by regex",
    },
    {
        "I",
        function()
            require("multicursor-nvim").insertVisual()
        end,
        mode = "v",
        desc = "Insert for each line of visual selections",
    },
    {
        "A",
        function()
            require("multicursor-nvim").appendVisual()
        end,
        mode = "v",
        desc = "Append for each line of visual selections",
    },
    {
        "M",
        function()
            require("multicursor-nvim").matchCursors()
        end,
        mode = "v",
        desc = "match new cursors within visual selections by regex",
    },
    {
        "<leader>t",
        function()
            require("multicursor-nvim").transposeCursors(1)
        end,
        mode = "v",
        desc = "Rotate visual selection contents",
    },
    {
        "<leader>T",
        function()
            require("multicursor-nvim").transposeCursors(-1)
        end,
        mode = "v",
        desc = "Rotate visual selection contents",
    },
    ]]
}

return keys
