---@type table
local cmds = {
    "SidebarNvimToggle",
    "SidebarNvimClose",
    "SidebarNvimOpen",
    "SidebarNvimUpdate",
    "SidebarNvimResize",
    "SidebarNvimFocus",
}

---@type LazySpec[]
local dependencies = {
    --"sidebar-nvim/sections-dap",
}

---@type table
local opts = {
    side = "right",
    hide_statusline = true,
    sections = {
        "datetime",
        "git",
        "diagnostics",
        --require("dap-sidebar-nvim.breakpoints"),
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    --[[
    dap = {
        breakpoints = {
            icon = "🔍",
        },
    },
    ]]
}

---@type LazySpec
local spec = {
    "sidebar-nvim/sidebar.nvim",
    --lazy = false,
    cmd = cmds,
    event = "BufEnter",
    dependencies = dependencies,
    opts = opts,
    --cond = false,
}

return spec
