---@type table
local key_mode = { "n", "x" }

---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>re",
        function()
            return require("refactoring").refactor("Extract Function")
        end,
        mode = key_mode,
        { expr = true },
    },
    {
        "<leader>rf",
        function()
            return require("refactoring").refactor("Extract Function To File")
        end,
        mode = key_mode,
        { expr = true },
    },
    {
        "<leader>rv",
        function()
            return require("refactoring").refactor("Extract Variable")
        end,
        mode = key_mode,
        { expr = true },
    },
    {
        "<leader>rI",
        function()
            return require("refactoring").refactor("Inline Function")
        end,
        mode = key_mode,
        { expr = true },
    },
    {
        "<leader>ri",
        function()
            return require("refactoring").refactor("Inline Variable")
        end,
        mode = key_mode,
        { expr = true },
    },
    {
        "<leader>rbb",
        function()
            return require("refactoring").refactor("Extract Block")
        end,
        mode = key_mode,
        { expr = true },
    },
    {
        "<leader>rbf",
        function()
            return require("refactoring").refactor("Extract Block To File")
        end,
        mode = key_mode,
        { expr = true },
    },
}

return keys
