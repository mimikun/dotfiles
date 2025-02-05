---@type boolean
local cond = not require("config.global").is_wsl
cond = false

---@type LazySpec
local spec = {
    "vyfor/cord.nvim",
    build = ":Cord update",
    --lazy = false,
    cmd = "Cord",
    opts = require("plugins.cord-nvim.opts"),
    cond = cond,
    enabled = cond,
}

return spec
