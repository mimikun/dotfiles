---@type table
local cmds = {
    "Legendary",
    "LegendaryRepeat",
}

---@type LazySpec
local spec = {
    "mrjones2014/legendary.nvim",
    lazy = false,
    priority = 10000,
    --ft = "",
    cmd = cmds,
    --keys = "",
    --event = "VeryLazy",
    dependencies = { "kkharji/sqlite.lua" },
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec
