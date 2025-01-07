---@type LazySpec[]
local dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-telekasten/calendar-vim",
}

---@type LazySpec
local spec = {
    "renerocksai/telekasten.nvim",
    --lazy = false,
    cmd = "Telekasten",
    --keys = keys,
    dependencies = dependencies,
    config = function()
        require("telekasten").setup(require("plugins.telekasten-nvim.opts"))
    end,
    cond = false,
    enabled = false,
}

return spec
