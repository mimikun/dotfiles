---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>cc",
        function()
            require("codex").toggle()
        end,
        mode = "n",
        desc = "Toggle Codex popup",
        { noremap = true, silent = true },
    },
}

return keys
