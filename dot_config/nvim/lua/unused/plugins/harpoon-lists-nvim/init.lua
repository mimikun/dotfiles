---@type LazySpec
local spec = {
    "frenchef156/harpoon-lists.nvim",
    --lazy = false,
    cmd = "HarpoonLists",
    keys = require("plugins.harpoon-lists-nvim.keys"),
    dependencies = require("plugins.harpoon-lists-nvim.dependencies"),
    config = function()
        require("harpoon-lists"):setup()
    end,
    cond = false,
    enabled = false,
}

return spec
