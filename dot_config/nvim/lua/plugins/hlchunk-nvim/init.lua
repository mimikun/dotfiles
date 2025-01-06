---@type table
local opts = {
    chunk = require("plugins.hlchunk-nvim.chunk"),
    indent = require("plugins.hlchunk-nvim.indent"),
    line_num = require("plugins.hlchunk-nvim.line_num"),
    blank = require("plugins.hlchunk-nvim.blank"),
}

---@type LazySpec
local spec = {
    "shellRaining/hlchunk.nvim",
    --lazy = false,
    cmd = require("plugins.hlchunk-nvim.cmds"),
    event = "BufEnter",
    opts = opts,
    --cond = false,
    --enabled = false,
}

return spec
