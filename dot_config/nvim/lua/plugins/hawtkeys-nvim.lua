---@type table
local cmds = {
    "Hawtkeys",
    "HawtkeysAll",
    "HawtkeysDupes",
}

return {
    "tris203/hawtkeys.nvim",
    --lazy = false,
    --event = "VeryLazy",
    cmd = cmds,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    --cond = false,
}
