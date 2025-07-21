---@type boolean
local use_github_copilot = require("config.settings").use_github_copilot

---@type LazySpec
local spec = {
    "zbirenbaum/copilot.lua",
    --lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = { "fuegoio/copiloutre.nvim" },
    opts = require("plugins.copilot.opts"),
    cond = use_github_copilot,
    enabled = use_github_copilot,
}

return spec
