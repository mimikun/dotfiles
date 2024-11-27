---@type table
local opts = {
    styles = {
        notification = {
            wo = { wrap = true },
        },
    },
    bigfile = { enabled = true },
    dashboard = require("plugins.configs.snacks-nvim.dashboard"),
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = true },
}

return opts
