---@type boolean
local cond = require("config.settings").use_ai

-- Only on MacOS or Linux
---@type string
local build = require("config.global").is_windows and "" or "make tiktoken"

---@type LazySpec[]
local dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
}

---@type LazySpec
local spec = {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = build,
    branch = "canary",
    --lazy = false,
    cmd = require("plugins.configs.copilotchat-nvim.cmds"),
    dependencies = dependencies,
    opts = {},
    cond = cond,
}

return spec
