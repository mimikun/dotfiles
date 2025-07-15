---@type boolean
local cond = require("config.settings").use_github_copilot

---@type LazySpec
local spec = {
    "zbirenbaum/copilot.lua",
    --lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = { "fuegoio/copiloutre.nvim" },
    opts = require("plugins.copilot.opts"),
    cond = cond,
    enabled = cond,
}

return spec
