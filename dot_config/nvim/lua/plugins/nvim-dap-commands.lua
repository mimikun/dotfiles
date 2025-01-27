---@type table
local cmds = {
    "Debugpy",
    "DebugLldbRust",
    "DebugGdb",
    "DebugLldb",
}

---@type LazySpec
local spec = {
    "theHamsta/nvim-dap-commands",
    --lazy = false,
    cmd = cmds,
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec
