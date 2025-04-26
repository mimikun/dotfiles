---@type TimeMachine.Config
local opts = {
    split_opts = {
        split = "left", -- where to open the tree panel
        width = 50, -- width of the tree panel
    },
    diff_tool = "native", -- default diff engine
    native_diff_opts = {
        result_type = "unified",
        ctxlen = 3,
        algorithm = "histogram",
    },
    ignore_filesize = nil, -- e.g. 10 * 1024 * 1024
    ignored_filetypes = {
        "terminal",
        "nofile",
        "time-machine-list",
        "mason",
        "snacks_picker_list",
        "snacks_picker_input",
        "snacks_dashboard",
        "snacks_notif_history",
        "lazy",
    },
}

return opts
