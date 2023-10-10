local is_git = require("utils.func").is_git

return {
    -- TODO: setting
    -- https://github.com/nvim-telescope/telescope.nvim
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
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
        --        -- Ctrl+gで文字列検索を開く
        --        -- <S-?>でプレビューを表示/非表示する
        --        -- TODO: Luaで書く
        --        -- https://github.com/junegunn/fzf.vim/blob/master/README.md
        --        vim.cmd([[
        --                command! -bang -nargs=* Rg
        --                \ call fzf#vim#grep(
        --                \ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
        --                \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
        --                \ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
        --                \ <bang>0)
        --        ]])
        --        vim.keymap.set("n", "<C-g>", function()
        --            vim.cmd(":Rg<CR>")
        --        end)
        --

        -- frでカーソル位置の単語をファイル検索する
        -- frで選択した単語をファイル検索する
        vim.keymap.set("n", "fr", builtin.grep_string)
        --        vim.keymap.set("n", "fr", function()
        --            vim.cmd('vawy:Rg <C-R>"<CR>')
        --        end)
        --        vim.keymap.set("x", "fr y", function()
        --            vim.cmd(':Rg <C-R>"<CR>')
        --        end)

        -- fbでバッファ検索を開く
        vim.keymap.set("n", "fb", builtin.buffers)

        -- fpでバッファの中で1つ前に開いたファイルを開く
        --vim.keymap.set("n", "fp", ":Buffers<CR><CR>")

        --        -- fpでバッファの中で1つ前に開いたファイルを開く
        --        vim.keymap.set("n", "fp", function()
        --            vim.cmd(":Buffers<CR><CR>")
        --        end)

        -- flで開いているファイルの文字列検索を開く
        vim.keymap.set("n", "fl", ":BLines<CR>")

        -- fmでマーク検索を開く
        vim.keymap.set("n", "fm", builtin.marks)

        -- fhでファイル閲覧履歴検索を開く
        vim.keymap.set("n", "fh", builtin.oldfiles)

        -- fcでコミット履歴検索を開く
        --vim.keymap.set("n", "fc", ":Commits<CR>")
        --        -- fcでコミット履歴検索を開く
        --        vim.keymap.set("n", "fc", function()
        --            vim.cmd(":Commits<CR>")
        --        end)
    end,
    cond = false,
}
