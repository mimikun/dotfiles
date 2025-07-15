---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>og",
        function()
            require("gemini").toggle_gemini_cli()
        end,
        mode = "n",
        { noremap = true, silent = true },
    },
}

return keys
