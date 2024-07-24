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
local dependencies = {
    "sidebar-nvim/sections-dap",
}

---@type LazySpec
local spec = {
    "sidebar-nvim/sidebar.nvim",
    --lazy = false,
    dependencies = dependencies,
    cmd = cmds,
    config = function()
        local sidebar = require("sidebar-nvim")
        sidebar.setup({
            open = false,
            side = "right",
            hide_statusline = false,
            update_interval = 1000,
            sections = {
                "datetime",
                "git",
                "diagnostics",
                require("dap-sidebar-nvim.breakpoints"),
            },
            section_separator = { "", "-----", "" },
            section_title_separator = { "" },
            containers = {
                attach_shell = "/bin/sh",
                show_all = true,
                interval = 5000,
            },
            datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
            todos = { ignored_paths = { "~" } },
            dap = {
                breakpoints = {
                    icon = "🔍",
                },
            },
        })
    end,
    --cond = false,
}

return spec
