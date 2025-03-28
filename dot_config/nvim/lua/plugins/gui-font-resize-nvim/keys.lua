---@type table
local key_opts = { noremap = true, silent = true }

---@type LazyKeysSpec[]
local keys = {
    { "<A-Up>", "<cmd>:GUIFontSizeUp<CR>", mode = "n", key_opts },
    { "<A-Down>", "<cmd>:GUIFontSizeDown<CR>", mode = "n", key_opts },
    { "<A-0>", "<cmd>:GUIFontSizeSet<CR>", mode = "n", key_opts },
}

return keys
