---@module 'blink.cmp'
---@type blink.cmp.Config
local opts = {
    keymap = require("plugins.blink-cmp.keymap"),
    completion = require("plugins.blink-cmp.completion"),
    appearance = require("plugins.blink-cmp.appearance"),
    signature = { enabled = true },
    snippets = { preset = "luasnip" },
    sources = {
        default = require("plugins.blink-cmp.sources.default"),
        per_filetype = {
            org = { "orgmode" },
        },
        providers = require("plugins.blink-cmp.sources.providers"),
    },
}

return opts
