---@type string
local header = require("plugins.snacks-nvim.dashboard.logos.buruaka.koyuki_nande")

---@class snacks.dashboard.Config
local config = {
    enabled = true,
    pane_gap = 4,
    preset = {
        keys = require("plugins.snacks-nvim.dashboard.keys"),
        header = header,
    },
    sections = require("plugins.snacks-nvim.dashboard.sections"),
}

return config
