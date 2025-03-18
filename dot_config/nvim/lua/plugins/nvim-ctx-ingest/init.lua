---@type LazySpec
local spec = {
    "0xrusowsky/nvim-ctx-ingest",
    --lazy = false,
    cmd = "CtxIngest",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("plugins.nvim-ctx-ingest.opts"),
    cond = false,
    enabled = false,
}

return spec
