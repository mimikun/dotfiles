--require('gh-dash').status() -- drop in to your lualine sections

---@type LazySpec
local spec = {
    "johnseth97/gh-dash.nvim",
    --lazy = false,
    cmd = require("plugins.gh-dash-nvim.cmds"),
    keys = require("plugins.gh-dash-nvim.keys"),
    opts = require("plugins.gh-dash-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
