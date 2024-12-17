---@type table
local opts = {
    display_mode = "float",
    split_direction = "vertical",
    --split_direction = "horizontal",
    icons = {
        inlay = {
            loading = "⏳",
            done = "✅",
            error = "❌",
        },
        lualine = "🐼",
    },
    winbar = false,
    treesitter = false,
}

---@type LazySpec
local spec = {
    "mistweaverco/kulala.nvim",
    --lazy = false,
    ft = "http",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
