---@type table
local keys = {
    { "<C-t>", desc = "Use dmacro" },
}

---@type table
local opts = {
    dmacro_key = "<C-t>",
}

---@type LazySpec
local spec = {
    "tani/dmacro.nvim",
    --lazy = false,
    keys = keys,
    opts = opts,
    --cond = false,
}

return spec
