---@type table
local cmds = {
    "CommandExecute",
    "CommandRexecute",
}

---@type LazySpec
local spec = {
    "vieitesss/command.nvim",
    --lazy = false,
    cmd = cmds,
    opts = {},
    cond = false,
    enabled = false,
}

return spec
