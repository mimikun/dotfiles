---@type LazySpec
local spec = {
    "theHamsta/nvim-dap-commands",
    --lazy = false,
    cmd = require("plugins.nvim-dap-commands.cmds"),
    opts = {},
    --cond = false,
    --enabled = false,
}

return spec
