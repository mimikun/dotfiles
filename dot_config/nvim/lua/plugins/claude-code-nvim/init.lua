---@type boolean
local use_claude_code = require("config.settings").use_claude_code

---@type LazySpec
local spec = {
    "greggh/claude-code.nvim",
    --lazy = false,
    cmd = require("plugins.claude-code-nvim.cmds"),
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require("plugins.claude-code-nvim.opts"),
    cond = use_claude_code,
    enabled = use_claude_code,
}

return spec
