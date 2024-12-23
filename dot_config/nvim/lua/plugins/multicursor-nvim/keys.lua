local n_v_mode = { "n", "v" }

---@type LazyKeysSpec[]
local keys = {
    {
        "<up>",
        function()
            require("multicursor-nvim").lineAddCursor(-1)
        end,
        mode = n_v_mode,
        desc = "Add cursor above/below the main cursor",
    },
    {
        "<down>",
        function()
            require("multicursor-nvim").lineAddCursor(1)
        end,
        mode = n_v_mode,
        desc = "Add cursor above/below the main cursor",
    },
    {
        "<leader><up>",
        function()
            require("multicursor-nvim").lineSkipCursor(-1)
        end,
        mode = n_v_mode,
        desc = "Skip cursor above/below the main cursor",
    },
    {
        "<leader><down>",
        function()
            require("multicursor-nvim").lineSkipCursor(1)
        end,
        mode = n_v_mode,
        desc = "Skip cursor above/below the main cursor",
    },
    {
        "<leader>n",
        function()
            require("multicursor-nvim").matchAddCursor(1)
        end,
        mode = n_v_mode,
        desc = "Add adding a new cursor by matching word/selection",
    },
    {
        "<leader>s",
        function()
            require("multicursor-nvim").matchSkipCursor(1)
        end,
        mode = n_v_mode,
        desc = "Skip adding a new cursor by matching word/selection",
    },
    {
        "<leader>N",
        function()
            require("multicursor-nvim").matchAddCursor(-1)
        end,
        mode = n_v_mode,
        desc = "Add adding a new cursor by matching word/selection",
    },
    {
        "<leader>S",
        function()
            require("multicursor-nvim").matchSkipCursor(-1)
        end,
        mode = n_v_mode,
        desc = "Skip adding a new cursor by matching word/selection",
    },
    {
        "<leader>A",
        function()
            require("multicursor-nvim").matchAllAddCursors()
        end,
        mode = n_v_mode,
        desc = "Add all matches in the document",
    },
    --###############################################
    --[[
    {
        "<right>",
        function()
            require("multicursor-nvim").addCursor("w")
        end,
        mode = "n",
        desc = "You can also add cursors with any motion you prefer",
    },
    {
        "<leader><right>",
        function()
            require("multicursor-nvim").skipCursor("w")
        end,
        mode = "n",
        desc = "You can also add cursors with any motion you prefer",
    },
    ]]
    --###############################################
    {
        "<left>",
        function()
            require("multicursor-nvim").nextCursor()
        end,
        mode = n_v_mode,
        desc = "Rotate the main cursor",
    },
    {
        "<right>",
        function()
            require("multicursor-nvim").prevCursor()
        end,
        mode = n_v_mode,
        desc = "Rotate the main cursor",
    },
    {
        "<leader>x",
        function()
            require("multicursor-nvim").deleteCursor()
        end,
        mode = n_v_mode,
        desc = "Delete the main cursor",
    },
    {
        "<c-leftmouse>",
        function()
            require("multicursor-nvim").handleMouse()
        end,
        mode = "n",
        desc = "Add and remove cursors with control + left click",
    },
    {
        "<c-q>",
        function()
            require("multicursor-nvim").toggleCursor()
        end,
        mode = n_v_mode,
        desc = "Easy way to add and remove cursors using the main cursor",
    },
    {
        "<leader><c-q>",
        function()
            require("multicursor-nvim").duplicateCursors()
        end,
        mode = n_v_mode,
        desc = "Clone every cursor and disable the originals",
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
    {
        "<c-i>",
        function()
            require("multicursor-nvim").jumpForward()
        end,
        mode = n_v_mode,
        desc = "Jumplist support",
    },
    {
        "<c-o>",
        function()
            require("multicursor-nvim").jumpBackward()
        end,
        mode = n_v_mode,
        desc = "Jumplist support",
    },
}

return keys
