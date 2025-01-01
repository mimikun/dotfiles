---@type table
local cmds = {
    "Noice",
    "NoiceLast",
    "NoiceDisable",
}

---@type LazySpec[]
local dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    { "iguanacucumber/magazine.nvim", name = "nvim-cmp" },
}

---@type LazySpec
local spec = {
    "folke/noice.nvim",
    --lazy = false,
    event = "VeryLazy",
    cmd = cmds,
    dependencies = dependencies,
    opts = require("plugins.noice-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
