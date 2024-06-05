---@type table
local keys = {
    { "w", mode = "c", desc = "You can mkdir -p" },
}

---@type LazySpec
local spec = {
    "jghauser/mkdir.nvim",
    --lazy = false,
    --event = "VeryLazy",
    keys = keys,
    --cond = false,
}

return spec
