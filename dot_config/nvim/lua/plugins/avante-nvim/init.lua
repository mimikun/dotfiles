local global = require("config.global")

-- NOTE: only be enabled at Home-azusa
---@type boolean
local cond = global.is_azusa

local build = function()
    if global.is_windows then
        return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    else
        return "make BUILD_FROM_SOURCE=true"
    end
end

---@type LazySpec
local spec = {
    "yetone/avante.nvim",
    version = false,
    build = build,
    --lazy = false,
    cmd = require("plugins.avante-nvim.cmds"),
    event = "VeryLazy",
    dependencies = require("plugins.avante-nvim.dependencies"),
    opts = require("plugins.avante-nvim.opts"),
    cond = cond,
    enabled = cond,
}

return spec
