---@type boolean
local cond = require("config.settings").use_claude_code

---@type LazySpec
local spec = {
    "Namacha411/ccusage.nvim",
    --lazy = false,
    cmd = require("plugins.ccusage-nvim.cmds"),
    opts = require("plugins.ccusage-nvim.opts"),
    cond = cond,
    enabled = cond,
}

return spec
