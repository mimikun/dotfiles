---@type LazySpec
local spec = {
    "DimitrisDimitropoulos/yasp.nvim",
    --lazy = false,
    event = "InsertEnter",
    opts = require("plugins.yasp-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
