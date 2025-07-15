---@type boolean
local cond = require("config.settings").use_gemini_cli

---@type LazySpec
local spec = {
    "jonroosevelt/gemini.nvim",
    --lazy = false,
    keys = require("plugins.gemini-nvim.keys"),
    opts = {},
    cond = cond,
    enabled = cond,
}

return spec
