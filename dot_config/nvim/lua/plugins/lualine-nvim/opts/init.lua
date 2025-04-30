---@type table
local opts = {
    options = require("plugins.lualine-nvim.opts.options"),
    sections = require("plugins.lualine-nvim.opts.sections"),
    tabline = {},
    --tabline = require("plugins.lualine-nvim.opts.tabline"),
    winbar = {},
    --winbar = require("plugins.lualine-nvim.opts.winbar"),
}

return opts
