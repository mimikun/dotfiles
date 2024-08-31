---@type table
local opts = {
    input = {
        enabled = false,
    },
}

---@type LazySpec
local spec = {
    "stevearc/dressing.nvim",
    --lazy = false,
    opts = opts,
    --cond = false,
}

return spec
