---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>tw",
        function()
            require("visual-whitespace").toggle()
        end,
        mode = { "n", "v" },
        desc = "Turn visual-whitespace.nvim off (toggles the enabled cfg flag)",
    },
}

return keys
