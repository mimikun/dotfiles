---@type table
local keys = {
    { "<C-n>", desc = "Toggle NvimTree" },
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
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "b0o/nvim-tree-preview.lua",
}

---@type LazySpec
local spec = {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    keys = keys,
    cmd = cmds,
    dependencies = dependencies,
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
        require("nvim-tree").setup({})
        require("nvim-tree-preview").setup({})
        vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
    end,
    --cond = false,
}

return spec
