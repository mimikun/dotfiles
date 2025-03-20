---@type table
local key_opts = {
    noremap = true,
    silent = true,
    --expr = true,
}

---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>,",
        function()
            require("bufferline").cycle(-1)
        end,
        mode = "n",
        key_opts,
        desc = "Move to previous",
    },
    {
        "<leader>.",
        function()
            require("bufferline").cycle(1)
        end,
        mode = "n",
        key_opts,
        desc = "Move to next",
    },
    {
        "<leader><",
        function()
            require("bufferline").move(-1)
        end,
        mode = "n",
        key_opts,
        desc = "Re-order to previous",
    },
    {
        "<leader>>",
        function()
            require("bufferline").move(1)
        end,
        mode = "n",
        key_opts,
        desc = "Re-order to next",
    },
    {
        "<leader>b1",
        function()
            require("bufferline").go_to(1)
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 1",
    },
    {
        "<leader>b2",
        function()
            require("bufferline").go_to(2)
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 2",
    },
    {
        "<leader>b3",
        function()
            require("bufferline").go_to(3)
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 3",
    },
    {
        "<leader>b4",
        function()
            require("bufferline").go_to(4)
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 4",
    },
    {
        "<leader>b5",
        function()
            require("bufferline").go_to(5)
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 5",
    },
    {
        "<leader>b6",
        function()
            require("bufferline").go_to(6)
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 6",
    },
    {
        "<leader>b7",
        function()
            require("bufferline").go_to(7)
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 7",
    },
    {
        "<leader>b8",
        function()
            require("bufferline").go_to(8)
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 8",
    },
    {
        "<leader>b9",
        function()
            require("bufferline").go_to(9)
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 9",
    },
    {
        "<leader>b$",
        function()
            require("bufferline").go_to(-1)
        end,
        mode = "n",
        key_opts,
        desc = "Goto last buffer",
    },
    {
        "<leader>c",
        function(bufnr)
            require("snacks").bufdelete(bufnr)
        end,
        mode = "n",
        key_opts,
        desc = "Close buffer",
    },
    {
        "<leader>bc",
        function(bufnr)
            require("snacks").bufdelete(bufnr)
        end,
        mode = "n",
        key_opts,
        desc = "Close buffer",
    },
    {
        "<leader>br",
        function()
            require("buffer-reopen.utils").reopen_last_closed_buffer()
        end,
        mode = "n",
        key_opts,
        desc = "Restore buffer",
    },
    {
        "<leader>bd",
        function()
            require("bufferline").sort_by("directory")
        end,
        mode = "n",
        key_opts,
        desc = "Sort automatically by Directory",
    },
    {
        "<leader>be",
        function()
            require("bufferline").sort_by("extension")
        end,
        mode = "n",
        key_opts,
        desc = "Sort automatically by Extension",
    },
    {
        "<leader>bt",
        function()
            require("bufferline").sort_by("tabs")
        end,
        mode = "n",
        key_opts,
        desc = "Sort automatically by Tabs",
    },
}

return keys
