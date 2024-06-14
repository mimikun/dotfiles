---@type table
local opts = {
    themes = require("plugins.sources.themery").selectables,
    themeConfigFile = require("core.global").themery_config,
    livePreview = true,
}

---@type LazySpec
local spec = {
    "zaldih/themery.nvim",
    --lazy = false,
    cmd = "Themery",
    opts = opts,
    --cond = false,
}

return spec
