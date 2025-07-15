---@type LazySpec
local spec = {
    "windwp/nvim-autopairs",
    --lazy = false,
    event = "InsertEnter",
    opts = require("plugins.nvim-autopairs.opts"),
    --cond = false,
    --enabled = false,
}

return spec
