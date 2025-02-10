---@type table
local opts = {
    size = {
        oil = { x = 400, y = 400 },
        main = { x = 800, y = 800 },
    },
    offset = {
        oil = { x = 5, y = 3 },
        main = { x = 10, y = 3 },
    },
    -- Fit / Stretch / Crop
    resizeMode = "Fit",
}

---@type LazySpec
local spec = {
    "skardyy/neo-img",
    --lazy = false,
    cmd = "NeoImgShow",
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
