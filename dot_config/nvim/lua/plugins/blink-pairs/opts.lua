--- @module 'blink.pairs'
--- @type blink.pairs.Config
local opts = {
    mappings = {
        enabled = true,
        pairs = {
            ["("] = ")",
            ["["] = "]",
            ["{"] = "}",
            ["'"] = { closing = "'", enter = false },
            ['"'] = { closing = '"', enter = false },
            ["`"] = { closing = "`", enter = false },
        },
    },
}

return opts
