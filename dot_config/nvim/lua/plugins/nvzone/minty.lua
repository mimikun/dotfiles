---@type table
local cmds = {
    "Huefy",
    "Shades",
}

---@type table
local opts = {
    huefy = { border = false },
    shades = { border = true },
}

---@type LazySpec
local spec = {
    "nvchad/minty",
    --lazy = false,
    cmd = cmds,
    dependencies = { "nvchad/volt" },
    opts = opts,
    cond = false,
    enabled = false,
}

return spec
