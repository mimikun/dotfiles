---@type LazySpec[]
local dependencies = {
    "nvim-tree/nvim-web-devicons",
    "refractalize/oil-git-status.nvim",
}

---@type table
local opts = {
    -- Window-local options to use for oil buffers
    win_options = {
        -- Use oil-git-status.nvim
        signcolumn = "yes:2",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
    },
    view_options = {
        -- Show files and directories that start with "."
        show_hidden = false,
    },
}

---@type LazySpec
local spec = {
    "stevearc/oil.nvim",
    lazy = false,
    cmd = "Oil",
    dependencies = dependencies,
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
        require("oil").setup(opts)
        require("oil-git-status").setup({})
    end,
    --cond = false,
}

return spec
