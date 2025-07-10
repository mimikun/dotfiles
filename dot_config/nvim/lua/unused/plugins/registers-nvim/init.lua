---@type LazySpec
local spec = {
    "tversteeg/registers.nvim",
    --lazy = false,
    cmd = "Registers",
    keys = require("plugins.registers-nvim.keys"),
    opts = require("plugins.registers-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
