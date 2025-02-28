---@class snacks.indent.Config
---@field enabled? boolean
local Config = {
    enabled = false,
    indent = require("plugins.snacks-nvim.indent.indent"),
    animate = require("plugins.snacks-nvim.indent.animate"),
    scope = require("plugins.snacks-nvim.indent.scope"),
    chunk = require("plugins.snacks-nvim.indent.chunk"),
    -- filter for buffers to enable indent guides
    filter = function(buf)
        return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
    end,
}

return Config
