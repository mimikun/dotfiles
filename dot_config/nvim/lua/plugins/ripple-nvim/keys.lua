---@type table
local key_mode = { "n", "v" }

---@type LazykeysSpec[]
local keys = {
    { "<C-Up>", mode = key_mode, desc = "expand up" },
    { "<C-Down>", mode = key_mode, desc = "expand down" },
    { "<C-Left>", mode = key_mode, desc = "expand left" },
    { "<C-Right>", mode = key_mode, desc = "expand right" },
}

return keys
