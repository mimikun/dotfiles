---@type LazySpec
local spec = {
    "theHamsta/nvim-dap-virtual-text",
    --lazy = false,
    cmd = require("plugins.nvim-dap-virtual-text.cmds"),
    dependencies = require("plugins.nvim-dap-virtual-text.dependencies"),
    opts = require("plugins.nvim-dap-virtual-text.opts"),
    cond = false,
    enabled = false,
}

return spec
