---@type boolean
local use_gemini_cli = require("config.settings").use_gemini_cli

---@type LazySpec
local spec = {
    "jonroosevelt/gemini.nvim",
    --lazy = false,
    keys = require("plugins.gemini-nvim.keys"),
    opts = {},
    cond = use_gemini_cli,
    enabled = use_gemini_cli,
}

return spec
