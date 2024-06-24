---@type table
local dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
}

---@type LazySpec
local spec = {
    "willothy/veil.nvim",
    --lazy = false,
    --ft = "",
    --cmd = "CMDNAME",
    --keys = "",
    --event = "VeryLazy",
    dependencies = dependencies,
    --init = function()
    --    INIT
    --end,
    opts = {},
    --cond = false,
}

return spec
