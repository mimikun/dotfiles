---@type LazySpec
local spec = {
    "mistweaverco/kulala.nvim",
    -- WORKAROUND: master branch has vimdoc bug, vimdoc 💩
    version = "*",
    --lazy = false,
    ft = "http",
    opts = require("plugins.kulala-nvim.opts"),
    --cond = false,
    --enabled = false,
}

return spec
