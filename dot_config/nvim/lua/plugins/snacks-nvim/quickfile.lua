---@class snacks.quickfile.Config
---@field enabled? boolean
local Config = {
    enabled = true,
    -- any treesitter langs to exclude
    exclude = { "latex" },
}

return Config
