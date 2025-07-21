---@type boolean
local use_claude_code = require("config.settings").use_claude_code

---@type LazySpec
local spec = {
    "Namacha411/ccusage.nvim",
    --lazy = false,
    cmd = require("plugins.ccusage-nvim.cmds"),
    opts = require("plugins.ccusage-nvim.opts"),
    cond = use_claude_code,
    enabled = use_claude_code,
}

return spec
