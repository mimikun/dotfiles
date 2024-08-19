---@type boolean
local cond = require("config.settings").use_ai

---@type table
local opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
}

---@type LazySpec
local spec = {
    "zbirenbaum/copilot.lua",
    --lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = opts,
    cond = cond,
}

return spec
