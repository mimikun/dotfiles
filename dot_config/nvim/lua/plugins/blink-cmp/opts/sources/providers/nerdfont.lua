---@module 'blink.cmp'
---@type blink.cmp.SourceProviderConfig
local nerdfont = {
    module = "blink-nerdfont",
    name = "Nerd Fonts",
    -- Tune by preference
    score_offset = 15,
    opts = {
        -- Insert nerdfont icon (default) or complete its name
        insert = true,
    },
}

return nerdfont
