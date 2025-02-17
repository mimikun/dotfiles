---@type table
local opts = {
    auto_open = true,
    oil_preview = true,
    -- auto / kitty / iterm / sixel
    backend = "auto",
    size = {
        x = 800,
        y = 800,
    },
    offset = {
        x = 10,
        y = 3,
    },
    -- Fit / Strech / Crop
    resizeMode = "Fit",
}

return opts
