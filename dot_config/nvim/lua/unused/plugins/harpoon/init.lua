---@type LazySpec
local spec = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    --lazy = false,
    --cmd = "CMDNAME",
    keys = require("plugins.harpoon.keys"),
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("harpoon"):setup({})
    end,
    cond = false,
    enabled = false,
}

return spec
