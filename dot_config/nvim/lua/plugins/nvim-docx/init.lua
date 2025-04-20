---@type LazySpec
local spec = {
    "marromlam/nvim-docx",
    --lazy = false,
    cmd = "EditDocx",
    keys = require("plugins.nvim-docx.keys"),
    opts = {},
    cond = false,
    enabled = false,
}

return spec
