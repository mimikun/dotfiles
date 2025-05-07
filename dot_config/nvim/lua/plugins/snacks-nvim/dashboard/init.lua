---@class snacks.dashboard.Config
local config = {
    enabled = true,
    pane_gap = 4,
    preset = {
        keys = require("plugins.snacks-nvim.dashboard.keys"),
        header = require("plugins.snacks-nvim.dashboard.header"),
    },
    sections = require("plugins.snacks-nvim.dashboard.sections"),
}

return config
