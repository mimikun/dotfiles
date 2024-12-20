---@module 'blink.cmp'
---@type blink.cmp.Config
local opts = {
    keymap = require("plugins.blink-cmp.opts.keymap"),
    enabled = function()
        local bo_buftype = vim.bo.buftype ~= "prompt"
        local b_completion = vim.b.completion ~= false
        return bo_buftype and b_completion
    end,
    snippets = require("plugins.blink-cmp.opts.snippets"),
    completion = require("plugins.blink-cmp.opts.completion"),
    appearance = require("plugins.blink-cmp.opts.appearance"),
    signature = { enabled = true },
    -- when `use_typo_resistance` enabled, allows for a number of typos relative to the length of the query disabling this matches the behavior of fzf
    fuzzy = { use_typo_resistance = true },
    sources = require("plugins.blink-cmp.opts.sources"),
}

return opts
