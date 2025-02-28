---@class snacks.Config
local opts = {
    bigfile = require("plugins.snacks-nvim.bigfile"),
    dashboard = require("plugins.snacks-nvim.dashboard"),
    explorer = require("plugins.snacks-nvim.explorer"),
    image = require("plugins.snacks-nvim.image"),
    indent = require("plugins.snacks-nvim.indent"),
    input = require("plugins.snacks-nvim.input"),
    notifier = require("plugins.snacks-nvim.notifier"),
    picker = require("plugins.snacks-nvim.picker"),
    quickfile = require("plugins.snacks-nvim.quickfile"),
    scope = require("plugins.snacks-nvim.scope"),
    scroll = require("plugins.snacks-nvim.scroll"),
    statuscolumn = require("plugins.snacks-nvim.statuscolumn"),
    styles = require("plugins.snacks-nvim.styles"),
    words = require("plugins.snacks-nvim.words"),
}

return opts
