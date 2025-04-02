---@type LazyKeysSpec[]
local keys = {
    { "v" },
    { "V" },
    { "<C-v>" },
    {
        "<leader>vw",
        function()
            require("visual-whitespace").toggle()
        end,
        mode = "n",
        desc = "Turn visual-whitespace.nvim off (toggles the `enabled` cfg flag)",
    },
}

return keys
