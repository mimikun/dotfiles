---@type boolean
local cond = require("config.settings").use_github_copilot

---@type table
local opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
    filetypes = {
        markdown = true,
        help = true,
    },
}

---@type LazySpec
local spec = {
    "zbirenbaum/copilot.lua",
    --lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = { "fuegoio/copiloutre.nvim" },
    opts = opts,
    cond = cond,
    enabled = cond,
}

return spec
