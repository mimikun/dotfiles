---@type LazySpec
local spec = {
    "anuvyklack/windows.nvim",
    --lazy = false,
    cmd = require("plugins.windows-nvim.cmds"),
    dependencies = require("plugins.windows-nvim.dependencies"),
    init = function()
        vim.o.winwidth = 10
        vim.o.winminwidth = 10
        vim.o.equalalways = false
    end,
    opts = require("plugins.windows-nvim.opts"),
    -- TODO: parts of winbuf-manage head
    cond = false,
    enabled = false,
}

return spec
