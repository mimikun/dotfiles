local completion = {
    keyword = require("plugins.blink-cmp.opts.completion.keyword"),
    trigger = require("plugins.blink-cmp.opts.completion.trigger"),
    list = require("plugins.blink-cmp.opts.completion.list"),
    accept = { auto_brackets = { enabled = true } },
    menu = require("plugins.blink-cmp.opts.completion.menu"),
    documentation = require("plugins.blink-cmp.opts.completion.documentation"),
    -- Displays a preview of the selected item on the current line
    ghost_text = {
        enabled = false,
    },
}

return completion
