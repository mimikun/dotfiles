---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>d",
        function()
            require("debugmaster").mode.toggle()
        end,
        mode = { "n", "t", "v" },
        { nowait = true },
    },
    {
        "<C-/>",
        "<C-\\><C-n>",
        mode = "t",
        desc = "Exit terminal mode",
    },
}

return keys
