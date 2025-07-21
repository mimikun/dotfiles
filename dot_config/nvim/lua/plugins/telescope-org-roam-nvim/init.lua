---@type LazySpec
local spec = {
    "bi0ha2ard/telescope-org_roam.nvim",
    --lazy = false,
    ft = { "org" },
    dependencies = require("plugins.telescope-org-roam-nvim.dependencies"),
    config = function()
        require("telescope").load_extension("org_roam")
    end,
    --cond = false,
    --enabled = false,
}

return spec
