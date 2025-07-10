-- TODO: ttyimg exist check

---@type LazySpec
local spec = {
    "skardyy/neo-img",
    --lazy = false,
    cmd = "NeoImg",
    opts = require("plugins.neo-img.opts"),
    cond = false,
    enabled = false,
}

return spec
