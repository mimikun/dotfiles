---@type LazySpec
local spec = {
    "fabridamicelli/cronex.nvim",
    build = "npm install -g cronstrue@latest",
    --lazy = false,
    cmd = require("plugins.cronex-nvim.cmds"),
    opts = require("plugins.cronex-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
