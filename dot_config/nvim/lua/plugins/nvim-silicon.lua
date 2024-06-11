---@type table
local opts = {
    theme = "GitHub",
    --font = "monospace",
}

---@type LazySpec
local spec = {
    "mimikun/silicon.nvim",
    --lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = opts,
    --cond = false,
}

return spec
