---@type LazySpec[]
local dependencies = {
    "nvim-lua/plenary.nvim",
    "davidmh/cspell.nvim",
}

---@type LazySpec
local spec = {
    "nvimtools/none-ls.nvim",
    --lazy = false,
    dependencies = dependencies,
    config = function()
        require("null-ls").setup(require("plugins.none-ls-nvim.opts"))
    end,
    cond = false,
    enabled = false,
}

return spec
