---@type table
local cmds = {
    "DapViewOpen",
    "DapViewClose",
    "DapViewToggle",
    "DapViewWatch",
}

---@type table
local opts = {
    winbar = {
        show = true,
        sections = {
            "watches",
            "exceptions",
            "breakpoints",
            "repl",
        },
        default_section = "watches",
    },
    windows = {
        height = 12,
    },
}

---@type LazySpec
local spec = {
    "igorlfs/nvim-dap-view",
    --lazy = false,
    cmd = cmds,
    dependencies = { "mfussenegger/nvim-dap" },
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
