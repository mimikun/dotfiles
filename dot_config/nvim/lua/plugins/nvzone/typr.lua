---@type table
local cmds = {
    "Typr",
    "TyprStats",
}

---@type LazySpec
local spec = {
    "nvzone/typr",
    --lazy = false,
    cmd = cmds,
    dependencies = { "nvzone/volt" },
    opts = {},
    cond = false,
    enabled = false,
}

return spec
