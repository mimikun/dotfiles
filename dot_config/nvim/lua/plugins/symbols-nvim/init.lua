---@type LazySpec
local spec = {
    "oskarrrrrrr/symbols.nvim",
    --lazy = false,
    cmd = require("plugins.symbols-nvim.cmds"),
    keys = require("plugins.symbols-nvim.keys"),
    config = function()
        local r = require("symbols.recipes")
        require("symbols").setup(r.DefaultFilters, r.AsciiSymbols, require("plugins.symbols-nvim.opts"))
    end,
    cond = false,
    enabled = false,
}

return spec
