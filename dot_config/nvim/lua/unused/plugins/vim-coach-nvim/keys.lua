---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>?",
        "<cmd>VimCoach<cr>",
        mode = "n",
        desc = "Vim Coach - Comprehensive Help",
    },
    {
        "<leader>hm",
        "<cmd>VimCoach motions<cr>",
        mode = "n",
        desc = "Vim Motions Help",
    },
    {
        "<leader>he",
        "<cmd>VimCoach editing<cr>",
        mode = "n",
        desc = "Vim Editing Help",
    },
    {
        "<leader>hv",
        "<cmd>VimCoach visual<cr>",
        mode = "n",
        desc = "Vim Visual Mode Help",
    },
    {
        "<leader>hp",
        "<cmd>VimCoach plugins<cr>",
        mode = "n",
        desc = "Plugin Commands Help",
    },
    {
        "<leader>hh",
        "<cmd>VimCoach all<cr>",
        mode = "n",
        desc = "All Commands Help",
    },
}

return keys
