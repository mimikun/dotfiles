---@type table
local key_mode = { "n", "x" }

---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>h",
        function()
            require("swm").h()
        end,
        mode = key_mode,
    },
    {
        "<leader>h",
        function()
            require("swm").h()
        end,
        mode = key_mode,
    },
    {
        "<leader>h",
        function()
            require("swm").h()
        end,
        mode = key_mode,
    },
    {
        "<leader>h",
        function()
            require("swm").h()
        end,
        mode = key_mode,
    },
}

return keys
