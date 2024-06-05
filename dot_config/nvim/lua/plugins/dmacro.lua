---@type table
local keys = {
    { "<C-t>", desc = "Use dmacro" },
}

---@type LazySpec
local spec = {
    "tani/dmacro.nvim",
    --lazy = false,
    keys = keybinds,
    opts = {
        dmacro_key = "<C-t>",
    },
}

return spec
