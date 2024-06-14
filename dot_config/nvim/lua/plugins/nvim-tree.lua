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

-- WORKAROUND: HEAD is broken
local commit_id = "e968df027d86797556e9bf5f1d5ffca87045150d"

---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    { "b0o/nvim-tree-preview.lua", commit = commit_id },
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
        require("nvim-tree-preview").setup({
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
            zindex = 100,
            -- NOTE: HEAD is broken, The new option doesn't work
            --[[
            show_title = true,
            -- top-left|top-center|top-right|bottom-left|bottom-center|bottom-right
            title_pos = "top-left",
            title_format = " %s ",
            ]]
        })
        vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
    end,
    --cond = false,
}

return spec
