---@type LazySpec
local spec = {
    "massix/org-checkbox.nvim",
    --lazy = false,
    ft = { "org" },
    keys = require("plugins.org-checkbox-nvim.keys"),
    config = function()
        require("orgcheckbox").setup({})
    end,
    --cond = false,
    --enabled = false,
}

return spec
