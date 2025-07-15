---@type LazySpec
local spec = {
    "nvimdev/template.nvim",
    --lazy = false,
    cmd = "Template",
    opts = require("plugins.template-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
