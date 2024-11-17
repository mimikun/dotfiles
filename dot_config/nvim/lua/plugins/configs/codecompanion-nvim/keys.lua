---@type table
local key_opts = { noremap = true, silent = true }

---@type LazyKeysSpec[]
local keys = {
    {
        "<C-a>",
        "<cmd>CodeCompanionActions<cr>",
        key_opts,
        mode = { "n", "v" },
    },
    {
        "<LocalLeader>a",
        "<cmd>CodeCompanionChat Toggle<cr>",
        key_opts,
        mode = { "n", "v" },
    },
    {
        "ga",
        "<cmd>CodeCompanionChat Add<cr>",
        key_opts,
        mode = "v",
    },
}

return keys
