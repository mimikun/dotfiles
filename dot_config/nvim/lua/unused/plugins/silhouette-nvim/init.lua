---@type boolean
local use_denops = require("config.settings").use_denops

---@type LazySpec
local spec = {
    "tadashi-aikawa/silhouette.nvim",
    lazy = false,
    ft = "markdown",
    cmd = require("plugins.silhouette-nvim.cmds"),
    dependencies = { "vim-denops/denops.vim" },
    config = function()
        vim.defer_fn(function()
            require("silhouette").setup(require("plugins.silhouette-nvim.opts"))
        end, 10000)
    end,
    cond = use_denops,
    enabled = use_denops,
}

return spec
