---@type LazyKeysSpec[]
local keys = {
    {
        "]#",
        function()
            vim.cmd("MarkMarkNextHeader")
        end,
        desc = "Next Header",
    },
    {
        "[#",
        function()
            vim.cmd("MarkMarkPrevHeader")
        end,
        desc = "Previous Header",
    },
    {
        "]`",
        function()
            vim.cmd("MarkMarkNextCode")
        end,
        desc = "Next Code Block",
    },
    {
        "[`",
        function()
            vim.cmd("MarkMarkPrevCode")
        end,
        desc = "Previous Code Block",
    },
    {
        "]|",
        function()
            vim.cmd("MarkMarkNextTable")
        end,
        desc = "Next Table",
    },
    {
        "[|",
        function()
            vim.cmd("MarkMarkPrevTable")
        end,
        desc = "Previous Table",
    },
}

return keys
