---@type LazySpec
local spec = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    --lazy = false,
    cmd = require("plugins.nvim-treesitter.cmds"),
    event = "VeryLazy",
    dependencies = require("plugins.nvim-treesitter.dependencies"),
    config = function()
        require("nvim-ts-autotag").setup({})
        require("nvim-treesitter.configs").setup(require("plugins.nvim-treesitter.opts"))
        require("treesitter-context").setup({})
        require("ts_context_commentstring").setup({
            enable_autocmd = false,
        })
    end,
    --cond = false,
    --enabled = false,
}

return spec
