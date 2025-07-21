---@type boolean
local use_github_copilot = require("config.settings").use_github_copilot

-- Only on MacOS or Linux
---@type string
local build = require("config.global").is_windows and "" or "make tiktoken"

---@type LazySpec
local spec = {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = build,
    --lazy = false,
    cmd = require("plugins.copilotchat-nvim.cmds"),
    --keys = require("plugins.copilotchat-nvim.keys"),
    dependencies = require("plugins.copilotchat-nvim.dependencies"),
    opts = require("plugins.copilotchat-nvim.opts"),
    cond = use_github_copilot,
    enabled = use_github_copilot,
}

return spec
