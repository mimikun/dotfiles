local is_git = require("utils.func").is_git

return {
    -- TODO: setting
    -- https://github.com/nvim-telescope/telescope.nvim
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    lazy = false,
    --event = "VimEnter",
    --cmd = "",
    keys = {
        { "<C-p>", desc = "Open file search" },
        { "<C-g>", desc = "Open string search" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local builtin = require("telescope.builtin")

        -- Ctrl+pでファイル検索を開く
        vim.keymap.set("n", "<C-p>", function()
            -- git管理されていれば:Telescope git_files
            -- そうでなければ:Telescope find_files
            if is_git then
                vim.cmd(":Telescope git_files")
            else
                vim.cmd(":Telescope find_files")
            end
        end, {})

        -- Ctrl+gで文字列検索を開く
        vim.keymap.set("n", "<C-g>", builtin.live_grep)

        -- frでカーソル位置の単語をファイル検索する
        -- frで選択した単語をファイル検索する
        vim.keymap.set("n", "fr", builtin.grep_string)

        -- fbでバッファ検索を開く
        vim.keymap.set("n", "fb", builtin.buffers)

        -- fpでバッファの中で1つ前に開いたファイルを開く
        -- TODO:

        -- flで開いているファイルの文字列検索を開く
        -- TODO:
        -- vim.keymap.set("n", "fl", ":BLines<CR>")

        -- fmでマーク検索を開く
        vim.keymap.set("n", "fm", builtin.marks)

        -- fhでファイル閲覧履歴検索を開く
        vim.keymap.set("n", "fh", builtin.oldfiles)

        -- fcでコミット履歴検索を開く
        -- TODO:
        -- vim.keymap.set("n", "fc", ":Commits<CR>")
    end,
    cond = false,
}
