---@type LazySpec
local spec = {
    "mimikun/spec-template",
    build = function()
        require("colorbox").update()
    end,
    -- NOTE: Don't lazy load it
    lazy = false,
    priority = 1000,
    cmd = "Colorbox",
    dependencies = require("plugins.colorbox-nvim.dependencies"),
    init = function()
        vim.opt.termguicolors = true
    end,
    opts = require("plugins.colorbox-nvim.opts"),
    cond = false,
    enabled = false,
}

return spec
