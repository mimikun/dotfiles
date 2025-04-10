---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local cmp_yanky = {
    name = "cmp_yanky",
    module = "blink.compat.source",
    score_offset = -3,
    opts = {
        -- only suggest items which match the current filetype
        onlyCurrentFiletype = false,
        -- only suggest items with a minimum length
        minLength = 3,
    },
}

return cmp_yanky
