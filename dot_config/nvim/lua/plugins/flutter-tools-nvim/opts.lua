---@type table
local opts = {
    ui = {
        border = "rounded",
        notification_style = "native",
    },
    decorations = {
        statusline = {
            app_version = true,
            device = true,
            project_config = true,
        },
    },
    debugger = {
        enabled = true,
        exception_breakpoints = {},
        evaluate_to_string_in_debug_views = true,
    },
    root_patterns = { ".git", "pubspec.yaml" },
    fvm = false,
    widget_guides = {
        enabled = false,
    },
    dev_tools = {
        autostart = false,
        auto_open_browser = false,
    },
    outline = {
        open_cmd = "30vnew",
        auto_open = false,
    },
}

return opts
