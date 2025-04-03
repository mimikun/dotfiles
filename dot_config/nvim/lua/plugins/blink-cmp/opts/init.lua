---@module 'blink.cmp'
---@type blink.cmp.Config
local opts = {
    keymap = require("plugins.blink-cmp.opts.keymap"),
    snippets = { preset = "luasnip" },
    completion = require("plugins.blink-cmp.opts.completion"),
    sources = {
        default = require("plugins.blink-cmp.opts.sources.default"),
        per_filetype = {
            org = { "orgmode" },
        },
        providers = require("plugins.blink-cmp.opts.sources.providers"),
    },
    cmdline = require("plugins.blink-cmp.opts.cmdline"),
    term = require("plugins.blink-cmp.opts.term"),
}

return opts
