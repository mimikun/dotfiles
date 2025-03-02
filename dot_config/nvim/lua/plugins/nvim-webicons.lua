---@type table
local opts = {
    data = {
        ["🌺 flores"] = {
            rosa = "🌹",
            lirio = "🌸",
            tulipan = "🌷",
        },
        ["🌵 cactus"] = {
            cactus1 = "🌵",
            cactus2 = "🪴",
        },
    },
}

---@type LazySpec
local spec = {
    "Hugo1974/nvim-webicons",
    --lazy = false,
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
