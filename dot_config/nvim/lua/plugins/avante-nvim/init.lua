local g = require("config.global")

---@type boolean
local is_home = g.is_home

---@type boolean
local is_windows = g.is_windows

---@type string|nil
local build = "make"

if is_windows then
    build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
elseif is_home then
    build = "make BUILD_FROM_SOURCE=true"
else
    build = "make"
end

---@type LazySpec
local spec = {
    "yetone/avante.nvim",
    build = build,
    -- NOTE: MUST set "false"
    version = false,
    --lazy = false,
    cmd = require("plugins.avante-nvim.cmds"),
    keys = require("plugins.avante-nvim.keys"),
    event = "VeryLazy",
    dependencies = require("plugins.avante-nvim.dependencies"),
    init = function()
        -- views can only be fully collapsed with the global statusline
        vim.opt.laststatus = 3
    end,
    opts = require("plugins.avante-nvim.opts"),
    cond = is_home,
    enabled = is_home,
}

return spec
