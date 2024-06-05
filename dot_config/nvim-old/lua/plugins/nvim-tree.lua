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

---@type LazySpec[]
local deps = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "b0o/nvim-tree-preview.lua",
}

---@type LazySpec
local spec = {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    keys = keymaps,
    cmd = cmds,
    --event = "VeryLazy",
    dependencies = deps,
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
        local nvim_tree = require("nvim-tree")
        local preview = require("nvim-tree-preview")

        nvim_tree.setup({})
        preview.setup({
            keymaps = {
                ["<Esc>"] = { action = "close", unwatch = true },
                ["<Tab>"] = { action = "toggle_focus" },
                ["<CR>"] = { open = "edit" },
                ["<C-t>"] = { open = "tab" },
                ["<C-v>"] = { open = "vertical" },
                ["<C-x>"] = { open = "horizontal" },
            },
            min_width = 10,
            min_height = 5,
            max_width = 85,
            max_height = 25,
            wrap = false,
            border = "rounded",
        })
        vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
    end,
    --cond = false,
}

return spec
