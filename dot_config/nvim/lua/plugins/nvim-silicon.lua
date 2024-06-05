-- Enable if executable silicon command
---@type boolean
local has_silicon = (1 == vim.fn.executable("silicon")) and true or false

---@type LazySpec
local spec = {
    "mimikun/silicon.nvim",
    --lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        theme = "GitHub",
        --font = "monospace",
    },
    cond = has_silicon,
}

return spec
