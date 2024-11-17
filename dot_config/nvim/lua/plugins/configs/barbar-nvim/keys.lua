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
            vim.cmd("BufferPrevious")
        end,
        mode = "n",
        key_opts,
        desc = "Move to previous",
    },
    {
        "<leader>.",
        function()
            vim.cmd("BufferNext")
        end,
        mode = "n",
        key_opts,
        desc = "Move to next",
    },
    {
        "<leader><",
        function()
            vim.cmd("BufferMovePrevious")
        end,
        mode = "n",
        key_opts,
        desc = "Re-order to previous",
    },
    {
        "<leader>>",
        function()
            vim.cmd("BufferMoveNext")
        end,
        mode = "n",
        key_opts,
        desc = "Re-order to next",
    },
    {
        "<leader>b1",
        function()
            vim.cmd("BufferGoto 1")
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 1",
    },
    {
        "<leader>b2",
        function()
            vim.cmd("BufferGoto 2")
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 2",
    },
    {
        "<leader>b3",
        function()
            vim.cmd("BufferGoto 3")
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 3",
    },
    {
        "<leader>b4",
        function()
            vim.cmd("BufferGoto 4")
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 4",
    },
    {
        "<leader>b5",
        function()
            vim.cmd("BufferGoto 5")
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 5",
    },
    {
        "<leader>b6",
        function()
            vim.cmd("BufferGoto 6")
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 6",
    },
    {
        "<leader>b7",
        function()
            vim.cmd("BufferGoto 7")
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 7",
    },
    {
        "<leader>b8",
        function()
            vim.cmd("BufferGoto 8")
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 8",
    },
    {
        "<leader>b9",
        function()
            vim.cmd("BufferGoto 9")
        end,
        mode = "n",
        key_opts,
        desc = "Goto buffer in 9",
    },
    {
        "<leader>b$",
        function()
            vim.cmd("BufferLast")
        end,
        mode = "n",
        key_opts,
        desc = "Goto last buffer",
    },
    {
        "<leader>p",
        function()
            vim.cmd("BufferPin")
        end,
        mode = "n",
        key_opts,
        desc = "Pin or unpin buffer",
    },
    {
        "<leader>c",
        function()
            vim.cmd("BufferClose")
        end,
        mode = "n",
        key_opts,
        desc = "Close buffer",
    },
    {
        "<leader>sc",
        function()
            vim.cmd("BufferRestore")
        end,
        mode = "n",
        key_opts,
        desc = "Restore buffer",
    },
    {
        "<C-p>",
        function()
            vim.cmd("BufferPick")
        end,
        mode = "n",
        key_opts,
        desc = "Magic buffer-picking mode: Pick",
    },
    {
        "<C-p>",
        function()
            vim.cmd("BufferPickDelete")
        end,
        mode = "n",
        key_opts,
        desc = "Magic buffer-picking mode: PickDelete",
    },
    {
        "<leader>bb",
        function()
            vim.cmd("BufferOrderByBufferNumber")
        end,
        mode = "n",
        key_opts,
        desc = "Sort automatically by BufferNumber",
    },
    {
        "<leader>bn",
        function()
            vim.cmd("BufferOrderByName")
        end,
        mode = "n",
        key_opts,
        desc = "Sort automatically by Name",
    },
    {
        "<leader>bd",
        function()
            vim.cmd("BufferOrderByDirectory")
        end,
        mode = "n",
        key_opts,
        desc = "Sort automatically by Directory",
    },
    {
        "<leader>bl",
        function()
            vim.cmd("BufferOrderByLanguage")
        end,
        mode = "n",
        key_opts,
        desc = "Sort automatically by Language",
    },
    {
        "<leader>bw",
        function()
            vim.cmd("BufferOrderByWindowNumber")
        end,
        mode = "n",
        key_opts,
        desc = "Sort automatically by WindowNumber",
    },
}

return keys
