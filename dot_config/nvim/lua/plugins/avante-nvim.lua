-- NOTE: only be enabled at Home-azusa and Work-Windows
---@type boolean
local cond = require("config.settings").use_avante

---@type table
local build_cmd = {
    linux = "make BUILD_FROM_SOURCE=true",
    windows = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false",
}

---@type string
local build = require("config.global").is_windows and build_cmd.windows and build_cmd.linux

---@type LazySpec
local spec = {
    "yetone/avante.nvim",
    version = false,
    build = build,
    lazy = false,
    cmd = require("plugins.configs.avante-nvim.cmds"),
    --keys = "",
    event = "VeryLazy",
    dependencies = require("plugins.configs.avante-nvim.dependencies"),
    init = function()
        -- TODO: write avante make command
        --[[
            hogehoge
        ]]
    end,
    opts = require("plugins.configs.avante-nvim.opts"),
    cond = cond,
    enabled = cond,
}

return spec
