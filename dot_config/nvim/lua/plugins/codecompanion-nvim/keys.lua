---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>ca",
        "<cmd>CodeCompanionActions<cr>",
        mode = { "n", "v" },
        --mode = { "n", "x" },
        { noremap = true, silent = true },
    },
    {
        "<leader>cc",
        "<Cmd>CodeCompanionChat Toggle<CR>",
        mode = { "n" },
        { noremap = true, silent = true },
    },
    {
        "<leader>cc",
        "<Cmd>CodeCompanionChat<CR>",
        mode = { "v" },
        { noremap = true, silent = true },
    },
    {
        "<leader>cA",
        "<Cmd>CodeCompanionChat Add<CR>",
        mode = { "v" },
        --mode = { "x" },
        { noremap = true, silent = true },
    },
    {
        "<leader>cd",
        function()
            require("codecompanion").prompt("docs")
        end,
        mode = { "n" },
        { noremap = true, silent = true },
    },
    {
        "<leader>ci",
        function()
            require("aibou.codecompanion").start()
        end,
        mode = { "n" },
        { noremap = true, silent = true },
        desc = "Start aibou",
    },
}

return keys
