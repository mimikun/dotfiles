---@type table
local opts = {
    -- Behavior
    preview_debounce = 150, -- ms delay for preview updates
    cache_duration = 24 * 60 * 60, -- 24 hours in seconds
    logging = "off", -- Levels: off, error, warn, log, debug
}

return opts
