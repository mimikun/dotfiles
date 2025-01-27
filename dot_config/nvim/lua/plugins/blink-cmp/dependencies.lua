-- NOTE: if is_home, use nightly feature, otherwise use pre-compiled binary
---@type boolean|string
local version = require("config.global").is_home and false or "*"

---@type LazySpec
local blink_compat = {
    "saghen/blink.compat",
    --lazy = false,
    version = version,
    opts = {},
}

---@type LazySpec[]
local dependencies = {
    { "xzbdmw/colorful-menu.nvim", opts = {}, optional = true },
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    "folke/lazydev.nvim",
    "moyiz/blink-emoji.nvim",
    "zbirenbaum/copilot.lua",
    "giuxtaposition/blink-cmp-copilot",
    "mikavilpas/blink-ripgrep.nvim",
    -- blink.compat
    blink_compat,
    "chrisgrieser/cmp_yanky",
    --"rcarriga/cmp-dap",
}

return dependencies
