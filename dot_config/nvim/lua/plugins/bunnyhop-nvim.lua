---@type LazyKeysSpec[]
local keys = {
    {
        "<C-h>",
        function()
            require("bunnyhop").hop()
        end,
        desc = "[H]op to predicted location.",
    },
}

---@type table
local opts = {
    api_key = "HF_API_KEY",
}

---@type LazySpec
local spec = {
    "PLAZMAMA/bunnyhop.nvim",
    lazy = false,
    keys = keys,
    opts = opts,
    -- WARN: thin plugin is beta now. not working.
    cond = false,
    enabled = false,
}

return spec
