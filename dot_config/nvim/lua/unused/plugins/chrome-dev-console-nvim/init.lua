---@type LazySpec
local spec = {
    "lucamot/chrome-dev-console.nvim",
    --lazy = false,
    cmd = require("plugins.chrome-dev-console-nvim.cmds"),
    dependencies = { "lucamot/chrome-remote.nvim" },
    opts = require("plugins.chrome-dev-console-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
