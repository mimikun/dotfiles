---@type table
local cmds = {
    "Stalker",
    "StalkerTotals",
    "StalkerResetSync",
    "StalkerResetRlSync",
}

---@type LazySpec
local spec = {
    "lnus/stalker.nvim",
    --lazy = false,
    cmd = cmds,
    opts = {},
    cond = false,
    enabled = false,
}

return spec
