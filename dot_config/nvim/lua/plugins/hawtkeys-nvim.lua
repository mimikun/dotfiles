---@type table
local cmds = {
    "Hawtkeys",
    "HawtkeysAll",
    "HawtkeysDupes",
}

---@type LazySpec
local spec = {
    "tris203/hawtkeys.nvim",
    --lazy = false,
    cmd = cmds,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    --cond = false,
}

return spec
