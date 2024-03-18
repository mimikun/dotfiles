---@type table
local keymaps = {
    { "<C-n>", desc = "Toggle Fern" },
}

---@type table
local cmds = {
    "NvimTreeOpen",
    "NvimTreeClose",
    "NvimTreeToggle",
    "NvimTreeFocus",
    "NvimTreeRefresh",
    "NvimTreeFindFile",
    "NvimTreeFindFileToggle",
    "NvimTreeClipboard",
    "NvimTreeResize",
    "NvimTreeCollapse",
    "NvimTreeCollapseKeepBuffers",
    "NvimTreeHiTest",
}

---@type LazySpec
local spec = {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    keys = keymaps,
    cmd = cmds,
    --event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
        local nvim_tree = require("nvim-tree")
        nvim_tree.setup({})
        vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
    end,
    --cond = false,
}

return spec
