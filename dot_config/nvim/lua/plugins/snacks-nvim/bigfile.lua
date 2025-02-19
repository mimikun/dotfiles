---@class snacks.bigfile.Config
---@field enabled? boolean
local Config = {
    enabled = true,
    notify = true,
    -- 150KB, 1KB = 1024byte
    size = 150 * 1024,
    line_length = 1000,
}

return Config
