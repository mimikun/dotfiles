---@type boolean
local cond = require("config.global").is_home

---@type LazyKeysSpec[]
local keys = {
    {
        "<C-j>",
        mode = { "n", "i", "c" },
        desc = "Toggle Kana-mode skkeleton",
    },
}

---@type LazySpec[]
local dependencies = {
    "vim-denops/denops.vim",
    "delphinus/skkeleton_indicator.nvim",
}

---@type LazySpec
local spec = {
    "vim-skk/skkeleton",
    lazy = false,
    keys = keys,
    --event = "User DenopsReady",
    dependencies = dependencies,
    config = function()
        vim.fn["skkeleton#config"] = require("plugins.configs.skkeleton.opts")
        vim.fn["skkeleton#initialize"]()
        vim.notify("skkeleton initialized!", vim.log.levels.DEBUG)

        vim.keymap.set("n", "<C-j>", "<Plug>(skkeleton-toggle)")
        vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-toggle)")
        vim.keymap.set("c", "<C-j>", "<Plug>(skkeleton-toggle)")

        require("skkeleton_indicator").setup(require("plugins.configs.skkeleton-indicator.opts"))
    end,
    cond = cond,
    enabled = cond,
}

return spec
