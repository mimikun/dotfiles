---@type LazySpec
local spec = {
    "shahshlok/vim-coach.nvim",
    --lazy = false,
    cmd = require("plugins.vim-coach-nvim.cmds"),
    keys = require("plugins.vim-coach-nvim.opts"),
    dependencies = { "folke/snacks.nvim" },
    init = function()
        -- Disable default keymaps
        -- Set vim.g.vim_coach_no_default_keymaps = 1 before setup
    end,
    opts = require("plugins.vim-coach-nvim.keys"),
    cond = false,
    enabled = false,
}

return spec
