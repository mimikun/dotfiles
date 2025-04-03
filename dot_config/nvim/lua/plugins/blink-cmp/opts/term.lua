---@module 'blink.cmp'
---@type blink.cmp.TermConfig
local term = {
    enabled = true,
    keymap = {
        ["<Tab>"] = { "show", "accept" },
    },
    completion = {
        menu = {
            auto_show = true,
        },
    },
}

return term
