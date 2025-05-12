---@type LazyKeysSpec[]
local keys = {
    {
        "<leader>lt",
        mode = "n",
        { silent = true, desc = "Cycle through list types for the current list" },
    },
    {
        "<C-Space>",
        mode = "n",
        { silent = true, desc = "Toggle checkbox state" },
    },
}

---@type LazySpec
local spec = {
    "hamidi-dev/org-list.nvim",
    --lazy = false,
    ft = { "org", "markdown" },
    keys = keys,
    dependencies = { "tpope/vim-repeat" },
    opts = {},
    cond = false,
    enabled = false,
}

return spec
