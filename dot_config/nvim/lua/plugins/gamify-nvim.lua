---@type table
local cmds = {
    "Gamify",
    "Langstats",
    "Achievements",
}

---@type LazySpec
local spec = {
    "grzegorzszczepanek/gamify.nvim",
    --lazy = false,
    cmd = cmds,
    opts = {},
    -- TODO: try now
    --cond = false,
    --enabled = false,
}

return spec
