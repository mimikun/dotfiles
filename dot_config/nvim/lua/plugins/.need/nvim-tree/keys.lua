---@type LazyKeysSpec[]
local keys = {
    {
        "<c-n>",
        function()
            require("nvim-tree.api").tree.toggle()
        end,
        mode = "n",
        desc = "Toggle NvimTree",
    },
}

return keys
