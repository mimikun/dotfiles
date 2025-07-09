---@type LazyKeysSpec[]
local keys = {
    { "<leader>mc", "<CMD>Toc<CR>", desc = "Table of contents" },
}

---@type LazySpec
local spec = {
    "yousefakbar/toc.nvim",
    --lazy = false,
    ft = "markdown",
    cmd = "Toc",
    --keys = keys,
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {},
    cond = false,
    enabled = false,
}

return spec
