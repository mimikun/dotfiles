local global = require("core.global")
local is_windows = global.is_windows

local is_git = false
local build_cmds = {
    make = "make",
    cmake = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release &&\
        cmake --build build --config Release &&\
        cmake --install build --prefix build",
}
local build_cmd = build_cmds.make
if is_windows then
    build_cmd = build_cmds.cmake
end

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
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = function()
                if not is_windows then
                    return build_cmd
                else
                    return nil
                end
            end,
        },
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local themes = require("telescope.themes")

        telescope.setup({})
        if not is_windows then
            return nil
            -- NOTE: Workaround
            --telescope.load_extension("fzf")
        end

        -- Ctrl+pでファイル検索を開く
        vim.keymap.set("n", "<C-p>", function()
            -- git管理されていれば:Telescope git_files
            -- そうでなければ:Telescope find_files
            if is_git then
                builtin.git_files()
            else
                builtin.find_files()
            end
        end, {})

        -- Ctrl+gで文字列検索を開く
        vim.keymap.set("n", "<C-g>", builtin.live_grep)

        -- frでカーソル位置, または選択した範囲の単語をファイル検索する
        vim.keymap.set("n", "fr", builtin.grep_string)

        -- fbでバッファ検索を開く
        vim.keymap.set("n", "fb", builtin.buffers)

        -- fmでマーク検索を開く
        vim.keymap.set("n", "fm", builtin.marks)

        -- foでファイル閲覧履歴検索を開く
        vim.keymap.set("n", "fo", builtin.oldfiles)

        -- fcでコミット履歴検索を開く
        vim.keymap.set("n", "fc", builtin.git_commits)

        -- fhでヘルプ検索を開く
        vim.keymap.set("n", "fh", function()
            builtin.help_tags(themes.get_ivy())
        end)
    end,
    --cond = false,
}
