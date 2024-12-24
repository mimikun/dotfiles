---@type LazyKeysSpec[]
local keys = {
    { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
    { "<leader>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
}

---@type LazySpec
local spec = {
    "linrongbin16/gitlinker.nvim",
    --lazy = false,
    cmd = "GitLink",
    keys = keys,
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec
