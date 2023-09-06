return {
    "junegunn/fzf.vim",
    --lazy = false,
    --event = "VeryLazy",
    keys = {
        { "<C-p>", ":call FzfOmniFiles()<CR>", desc = "Open file search" },
        { "<C-g>", ":Rg<CR>", desc = "Open string search" },
    },
    dependencies = {
        "junegunn/fzf",
    },
    config = function()
        -- Ctrl+pでファイル検索を開く
        -- git管理されていれば:GFiles、そうでなければ:Filesを実行する
        vim.cmd([[
                fun! FzfOmniFiles()
                    let is_git = system('git status')
                    if v:shell_error
                        :Files
                    else
                        :GFiles
                    endif
                endfun
            ]])

        vim.keymap.set("n", "<C-p>", ":call FzfOmniFiles()<CR>")

        -- Ctrl+gで文字列検索を開く
        -- <S-?>でプレビューを表示/非表示する
        vim.cmd([[
                command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
                \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
                \ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
                \ <bang>0)
            ]])
        vim.keymap.set("n", "<C-g>", ":Rg<CR>")

        -- frでカーソル位置の単語をファイル検索する
        vim.keymap.set("n", "fr", 'vawy:Rg <C-R>"<CR>')

        -- frで選択した単語をファイル検索する
        vim.keymap.set("x", "fr y", ':Rg <C-R>"<CR>')

        -- fbでバッファ検索を開く
        vim.keymap.set("n", "fb", ":Buffers<CR>")

        -- fpでバッファの中で1つ前に開いたファイルを開く
        vim.keymap.set("n", "fp", ":Buffers<CR><CR>")

        -- flで開いているファイルの文字列検索を開く
        vim.keymap.set("n", "fl", ":BLines<CR>")

        -- fmでマーク検索を開く
        vim.keymap.set("n", "fm", ":Marks<CR>")

        -- fhでファイル閲覧履歴検索を開く
        vim.keymap.set("n", "fh", ":History<CR>")

        -- fcでコミット履歴検索を開く
        vim.keymap.set("n", "fc", ":Commits<CR>")
    end,
    --cond = false,
}
