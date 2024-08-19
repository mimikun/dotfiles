---@type table
local cmds = {
    "Hawtkeys",
    "HawtkeysAll",
    "HawtkeysDupes",
}

---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
}

---@type table
local opts = {
    keyboardLayout = "qwerty",
}

---@type LazySpec
local spec = {
    "tris203/hawtkeys.nvim",
    --lazy = false,
    cmd = cmds,
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
