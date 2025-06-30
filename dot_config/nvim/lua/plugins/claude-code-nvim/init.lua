---@type boolean
local cond = require("config.settings").use_claude_code

---@type LazySpec
local spec = {
    "greggh/claude-code.nvim",
    --lazy = false,
    cmd = require("plugins.claude-code-nvim.cmds"),
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require("plugins.claude-code-nvim.opts"),
    cond = cond,
    enabled = cond,
}

return spec
