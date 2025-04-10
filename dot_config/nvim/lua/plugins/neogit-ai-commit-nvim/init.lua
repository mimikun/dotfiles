-- NOTE: need `set -Ux OPENAI_API_KEY "hogehoge"

---@type boolean
local cond = require("config.settings").use_llm

---@type LazySpec
local spec = {
    "lululau/neogit-ai-commit.nvim",
    --lazy = false,
    ft = "gitcommit",
    cmd = "NeogitAICommit",
    keys = require("plugins.neogit-ai-commit-nvim.keys"),
    event = "VeryLazy",
    dependencies = require("plugins.neogit-ai-commit-nvim.dependencies"),
    opts = require("plugins.neogit-ai-commit-nvim.opts"),
    cond = cond,
    enabled = cond,
}

return spec
