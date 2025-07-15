local global = require("config.global")

---@type string
local log_file = table.concat({ global.cache_dir .. "pendulum-log.csv" }, global.path_sep)

---@type table
local opts = {
    log_file = log_file,
    -- 5min(300msec)
    timeout_len = 300,
    -- 1min(60msec)
    timer_len = 60,
    gen_reports = true,
    top_n = 5,
    hours_n = 5,
    time_format = "24h",
    time_zone = "Japan/Tokyo",
    report_section_excludes = {
        "branch",
        "project",
    },
    report_excludes = {
        filetype = {
            -- TODO: more
            "neo-tree",
        },
        file = {},
        project = {},
        directory = {},
        branch = {},
    },
}

return opts
