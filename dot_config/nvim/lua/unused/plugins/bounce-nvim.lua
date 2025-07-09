---@type table
local cmds = {
    "BounceShowWordNumbers",
    "BounceHideWordNumbers",
}

---@type table
local opts = {
    delay_time = 1000,
    highlight_group_name = "@text.todo",
    more_jumps = false,
}

---@type LazySpec
local spec = {
    "R1PeR/bounce.nvim",
    --lazy = false,
    cmd = cmds,
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
