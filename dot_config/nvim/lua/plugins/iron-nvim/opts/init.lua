---@type table
local OPTS = {
    config = require("plugins.iron-nvim.opts.config"),
    keymaps = require("plugins.iron-nvim.opts.keymaps"),
    highlight = {
        italic = true,
    },
    ignore_blank_lines = true,
}

return OPTS
