---@type LazySpec
local spec = {
    "yarospace/lua-console.nvim",
    --lazy = false,
    cmd = "LuaConsole",
    keys = require("plugins.lua-console-nvim.keys"),
    opts = require("plugins.lua-console-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
