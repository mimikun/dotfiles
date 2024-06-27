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
    open = false,
    side = "right",
    hide_statusline = false,
    update_interval = 1000,
    sections = { "datetime", "git", "diagnostics" },
    section_separator = { "", "-----", "" },
    section_title_separator = { "" },
    containers = {
        attach_shell = "/bin/sh",
        show_all = true,
        interval = 5000,
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    todos = { ignored_paths = { "~" } },
}

---@type LazySpec
local spec = {
    "sidebar-nvim/sidebar.nvim",
    --lazy = false,
    cmd = cmds,
    opts = opts,
    --cond = false,
}

return spec
