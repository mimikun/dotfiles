---@type LazySpec
local spec = {
    "nvimtools/none-ls.nvim",
    --lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("null-ls").setup(require("plugins.none-ls-nvim.opts"))
    end,
    cond = false,
    enabled = false,
}

return spec
