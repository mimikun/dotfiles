---@type boolean
local cond = not require("config.global").is_windows

---@type boolean
local is_git = false

---@type table
local keys = {
    { "<C-p>", desc = "Open file search" },
    { "<C-g>", desc = "Open string search" },
    { "fr", desc = "Open grep string search" },
    { "fb", desc = "Open buffer search" },
    { "fm", desc = "Open mark search" },
    { "fo", desc = "Open file history search" },
    { "fc", desc = "Open git-commit log search" },
    { "fh", desc = "Open helptags search" },
}

---@type LazySpec[]
local dependencies = {
    -- NEED
    "nvim-lua/plenary.nvim",
    -- LINUX ONLY
    {
        "dharmx/telescope-media.nvim",
        cond = cond,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = cond,
    },
    -- OPTIONALS
    "tsakirist/telescope-lazy.nvim",
    "fdschmidt93/telescope-egrepify.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "ghassan0/telescope-glyph.nvim",
    "xiyaowong/telescope-emoji.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        dependencies = {
            "kkharji/sqlite.lua",
            "nvim-telescope/telescope-fzf-native.nvim",
        },
    },
}

---@type LazySpec
local spec = {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    --lazy = false,
    --cmd = "CMDNAME",
    keys = keys,
    --event = "VeryLazy",
    dependencies = dependencies,
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

        -- Load some extensions
        -- NOTE: Add some extensions if not a Windows
        if cond then
            telescope.load_extension("fzf")
            telescope.load_extension("media")
        end

        telescope.load_extension("smart_open")
        telescope.load_extension("frecency")
        telescope.load_extension("lazy")
        telescope.load_extension("file_browser")
        telescope.load_extension("egrepify")
        telescope.load_extension("glyph")
        telescope.load_extension("emoji")
    end,
    --cond = false,
}

return spec
