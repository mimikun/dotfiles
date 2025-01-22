---@type boolean
local cond = require("config.settings").use_denops

---@type LazySpec
local spec = {
    "vim-skk/skkeleton",
    lazy = false,
    keys = require("plugins.skkeleton.keys"),
    dependencies = require("plugins.skkeleton.dependencies"),
    config = function()
        vim.fn["skkeleton#config"] = require("plugins.skkeleton.opts")
        vim.fn["skkeleton#initialize"]()
        vim.notify("skkeleton initialized!", vim.log.levels.DEBUG)

        vim.keymap.set({ "n", "i", "c" }, "<C-j>", "<Plug>(skkeleton-toggle)")

        require("skkeleton_indicator").setup(require("plugins.skkeleton.indicator-opts"))
    end,
    cond = cond,
    enabled = cond,
}

return spec
