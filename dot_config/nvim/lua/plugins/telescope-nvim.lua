local is_git = false

local keymaps = {
    { "<C-p>", desc = "Open file search" },
    { "<C-g>", desc = "Open string search" },
    -- TODO: Fix which-key conflict error
    { "fr", desc = "Open grep string search" },
    { "fb", desc = "Open buffer search" },
    { "fm", desc = "Open mark search" },
    { "fo", desc = "Open file history search" },
    { "fc", desc = "Open git-commit log search" },
    { "fh", desc = "Open helptags search" },
}

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    lazy = false,
    --event = "VimEnter",
    --cmd = "",
    keys = keymaps,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local themes = require("telescope.themes")

        telescope.setup({})
        if is_git then
            -- Open git file search
            vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        else
            -- Open file search
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
        end

        -- Open string search
        vim.keymap.set("n", "<C-g>", builtin.live_grep, {})

        -- Open grep string search
        vim.keymap.set("n", "fr", builtin.grep_string, {})

        -- Open buffer search
        vim.keymap.set("n", "fb", builtin.buffers, {})

        -- Open mark search
        vim.keymap.set("n", "fm", builtin.marks, {})

        -- Open file history search
        vim.keymap.set("n", "fo", builtin.oldfiles, {})

        -- Open git-commit log search
        vim.keymap.set("n", "fc", builtin.git_commits, {})

        -- Open helptags search
        vim.keymap.set("n", "fh", function()
            builtin.help_tags(themes.get_ivy())
        end, {})
    end,
    --cond = false,
}
