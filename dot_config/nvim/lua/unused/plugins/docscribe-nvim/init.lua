---@type LazySpec
local spec = {
    "AdrianMosnegutu/docscribe.nvim",
    --lazy = false,
    cmd = "DocscribeGenerate",
    dependencies = require("plugins.docscribe-nvim.dependencies"),
    opts = require("plugins.docscribe-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
