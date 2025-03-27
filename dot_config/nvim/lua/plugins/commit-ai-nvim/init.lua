---@type LazySpec
local spec = {
    "Abizrh/commit-ai.nvim",
    --lazy = false,
    cmd = "Commit",
    dependencies = require("plugins.commit-ai-nvim.dependencies"),
    opts = require("plugins.commit-ai-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
