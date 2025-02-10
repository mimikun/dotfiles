---@type LazyKeysSpec[]
local keys = {
    { "gu", mode = "v", desc = "SelectUndo" },
}

---@type LazySpec
local spec = {
    "SunnyTamang/select-undo.nvim",
    --lazy = false,
    cmd = "SelectUndo",
    keys = keys,
    opts = {},
    cond = false,
    enabled = false,
}

return spec
