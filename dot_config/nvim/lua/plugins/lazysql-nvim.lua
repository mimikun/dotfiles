---@type LazyKeysSpec[]
local keys = {
    "<leader>ls",
    "<cmd>LazySql<CR>",
    mode = "n",
    { desc = "Toggle LazySql", noremap = true, silent = true },
}

---@type LazySpec
local spec = {
    "LostbBlizzard/lazysql.nvim",
    --lazy = false,
    cmd = "LazySql",
    keys = keys,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    cond = false,
    enabled = false,
}

return spec
