---@type LazySpec
local spec = {
    "jarenm1/nvim-buddy",
    --lazy = false,
    keys = { "<leader>q" },
    opts = require("plugins.nvim-buddy.opts"),
    --cond = false,
    --enabled = false,
}

return spec
