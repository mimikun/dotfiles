local global = require("core.global")

local home = global.home
local is_windows = global.is_windows

---@type boolean
local is_git = false

---@type table
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

---@type LazySpec
local fzf_sorter = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
}

---@type LazySpec[]
local smart_open_deps = {
    "kkharji/sqlite.lua",
}

---@type LazySpec[]
local telescope_media = {
    "dharmx/telescope-media.nvim",
}

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not is_windows then
    table.insert(smart_open_deps, fzf_sorter)
end

---@type LazySpec
local smart_open = {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    dependencies = smart_open_deps,
    config = function()
        if is_windows then
            vim.g.sqlite_clib_path = table.concat({ home, "utilities", "sqlite3.dll" }, "/")
        end
    end,
}

---@type LazySpec[]
local telescope_deps = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    smart_open,
    "ghassan0/telescope-glyph.nvim",
    "xiyaowong/telescope-emoji.nvim",
    "tsakirist/telescope-lazy.nvim",
    "fdschmidt93/telescope-egrepify.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
}

-- NOTE: Add fzf_sorter if not a Windows
-- Very difficult to build fzf on Windows
if not is_windows then
    table.insert(telescope_deps, fzf_sorter)
    table.insert(telescope_deps, telescope_media)
end

---@type LazySpec
local spec = {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    lazy = false,
    --event = "VimEnter",
    --cmd = "",
    keys = keymaps,
    dependencies = telescope_deps,
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

        -- NOTE: Add fzf_sorter if not a Windows
        -- Very difficult to build fzf on Windows
        if not is_windows then
            telescope.load_extension("fzf")
            telescope.load_extension("media")
        end
        telescope.load_extension("frecency")
        telescope.load_extension("smart_open")
        telescope.load_extension("glyph")
        telescope.load_extension("emoji")
        telescope.load_extension("lazy")
        telescope.load_extension("file_browser")
        telescope.load_extension("egrepify")
    end,
    --cond = false,
}

return spec
