---@class snacks.picker.Config
---@field enabled? boolean
local config = {
    enabled = true,
    prompt = " ",
    sources = require("plugins.snacks-nvim.picker.sources"),
    focus = "input",
    layout = require("plugins.snacks-nvim.picker.layout"),
    sort = {
        fields = {
            "score:desc",
            "#text",
            "idx",
        },
    },
    -- replace `vim.ui.select` with the snacks picker
    ui_select = true,
    ---@class snacks.picker.formatters.Config
    formatters = require("plugins.snacks-nvim.picker.formatters"),
    ---@class snacks.picker.previewers.Config
    previewers = require("plugins.snacks-nvim.picker.previewers"),
    win = {
        input = {
            keys = {
                ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
        },
    },
    ---@class snacks.picker.icons
    icons = {
        ui = {
            selected = "● ",
            -- selected = " ",
        },
    },
}

return config
