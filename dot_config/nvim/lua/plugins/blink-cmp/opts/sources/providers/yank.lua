---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local yank = {
    name = "yank",
    module = "blink-yanky",
    opts = {
        onlyCurrentFiletype = true,
        minLength = 3,
        -- default is no trigger character
        --trigger_characters = { '"' },
    },
}

return yank
