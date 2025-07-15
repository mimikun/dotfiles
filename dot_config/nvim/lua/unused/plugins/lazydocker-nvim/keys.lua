---@type table
local KEYS = {
    ---@type LazyKeysSpec[]
    crnvl96 = {
        {
            "<leader>ld",
            function()
                require("lazydocker").toggle()
            end,
            mode = { "n", "t" },
            {},
        },
    },
    ---@type LazyKeysSpec[]
    mgierada = {
        "<leader>ld",
        function()
            require("lazydocker").open()
        end,
        desc = "Open Lazydocker floating window",
    },
}

return KEYS
