---@type table
local cmds = {
    "SidebarNvimToggle",
    "SidebarNvimClose",
    "SidebarNvimOpen",
    "SidebarNvimUpdate",
    "SidebarNvimResize",
    "SidebarNvimFocus",
}

---@type table
local opts = {
    side = "right",
    hide_statusline = true,
    sections = {
        "datetime",
        "git",
        "diagnostics",
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
}

---@type LazySpec
local spec = {
    "sidebar-nvim/sidebar.nvim",
    --lazy = false,
    cmd = cmds,
    event = "BufEnter",
    opts = opts,
    --cond = false,
}

return spec
