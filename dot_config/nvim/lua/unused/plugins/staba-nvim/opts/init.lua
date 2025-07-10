---@type table
local opts = {
    enable_fade = true,
    enable_underline = true, -- used as a horizontal separator for each buffer.
    enable_statuscolumn = true,
    enable_statusline = true,
    enable_tabline = true,
    mode_line = "LineNr", -- choose from "LineNr"|"CursorLineNr"|"CursorLine" or nil
    nav_keys = "asdfghjklzxcvnmweryuiop", -- for assigning to navigation keys
    no_name = "[No Name]", -- a buffer name for an empty buffer
    ignore_filetypes = require("plugins.staba-nvim.opts.ignore_filetypes"),
    statuscolumn = require("plugins.staba-nvim.opts.statuscolumn"),
    statusline = require("plugins.staba-nvim.opts.statusline"),
    tabline = require("plugins.staba-nvim.opts.tabline"),
}

return opts
