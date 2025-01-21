---@class snacks.Config
local opts = {
    bigfile = {
        enabled = true,
        -- 150KB, 1KB = 1024byte
        size = 150 * 1024,
    },
    dashboard = require("plugins.snacks-nvim.dashboard"),
    indent = { enabled = false },
    input = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = true },
    styles = {
        notification = {
            wo = { wrap = true },
        },
    },
}

return opts
