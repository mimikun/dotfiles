---@class snacks.Config
local opts = {
    --animate = {},
    bigfile = {
        enabled = true,
        -- 150KB, 1KB = 1024byte
        size = 150 * 1024,
        line_length = 1000,
    },
    --bufdelete = nil,
    dashboard = require("plugins.snacks-nvim.dashboard"),
    --debug = nil,
    --dim = {},
    explorer = { enabled = true },
    --git = nil,
    --gitbrowse = {},
    --health = nil,
    --image = {},
    indent = { enabled = false },
    input = { enabled = false },
    --layout = {},
    --lazygit = {},
    --meta = nil,
    notifier = { enabled = true },
    --notify = nil,
    picker = require("plugins.snacks-nvim.picker"),
    --profiler = {},
    quickfile = { enabled = true },
    --rename = nil,
    scope = { enabled = false },
    --scratch = {},
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    styles = {
        notification = {
            wo = { wrap = true },
        },
    },
    --terminal = {},
    --toggle = {},
    --util = nil,
    --win = nil,
    words = { enabled = true },
    --zen = {},
}

return opts
