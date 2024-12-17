---@type table
local nvim_tree_preview_opts = require("plugins.configs.nvim-tree-preview.opts")

---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "b0o/nvim-tree-preview.lua",
}

---@type LazySpec
local spec = {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    --lazy = false,
    cmds = require("plugins.configs.nvim-tree.cmds"),
    keys = require("plugins.configs.nvim-tree.keys"),
    dependencies = dependencies,
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
        require("nvim-tree").setup({
            on_attach = require("plugins.configs.nvim-tree.actions").on_attach,

            sort = {
                sorter = "extension",
            },

            view = {
                width = "20%",
                side = "left",
                signcolumn = "no",
            },

            renderer = {
                highlight_git = true,
                highlight_opened_files = "name",
                icons = {
                    glyphs = {
                        git = {
                            unstaged = "!",
                            renamed = "»",
                            untracked = "?",
                            deleted = "✘",
                            staged = "✓",
                            unmerged = "",
                            ignored = "◌",
                        },
                    },
                },
            },

            actions = {
                expand_all = {
                    max_folder_discovery = 100,
                    exclude = { ".git", "target", "build" },
                },
            },
        })
        require("nvim-tree-preview").setup(nvim_tree_preview_opts)
    end,
    --cond = false,
    --enabled = false,
}

return spec
