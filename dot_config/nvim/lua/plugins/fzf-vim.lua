local is_git = false

local keymaps = {
    { "<C-p>", desc = "Open file search" },
    { "<C-g>", desc = "Open string search" },
    { "fr", desc = "Open grep string search" },
    { "fr y", desc = "Open grep selected string search" },
    { "fb", desc = "Open buffer search" },
    { "fp", desc = "Open previous buffer search" },
    { "fm", desc = "Open mark search" },
    { "fh", desc = "Open file history search" },
    { "fc", desc = "Open git-commit log search" },
    { "fl", desc = "Open current buffer lines search" },
}

return {
    "junegunn/fzf.vim",
    --lazy = false,
    --event = "VeryLazy",
    keys = keymaps,
    dependencies = {
        "junegunn/fzf",
    },
    config = function()
        -- Ctrl+pでファイル検索を開く
        -- git管理されていれば:GFiles、そうでなければ:Filesを実行する
        if is_git then
            vim.keymap.set("n", "<C-p>", function()
                vim.cmd(":GFiles")
            end, {})
        else
            vim.keymap.set("n", "<C-p>", function()
                vim.cmd(":Files")
            end, {})
        end

        -- Ctrl+gで文字列検索を開く
        -- <S-?>でプレビューを表示/非表示する
        -- TODO: Luaで書く
        -- https://github.com/junegunn/fzf.vim/blob/master/README.md
        vim.cmd([[
                command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
                \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
                \ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
                \ <bang>0)
        ]])
        vim.keymap.set("n", "<C-g>", function()
            vim.cmd(":Rg<CR>")
        end)

        -- frでカーソル位置の単語をファイル検索する
        vim.keymap.set("n", "fr", function()
            vim.cmd('vawy:Rg <C-R>"<CR>')
        end)

        -- frで選択した単語をファイル検索する
        vim.keymap.set("x", "fr y", function()
            vim.cmd(':Rg <C-R>"<CR>')
        end)

        -- fbでバッファ検索を開く
        vim.keymap.set("n", "fb", function()
            vim.cmd(":Buffers<CR>")
        end)

        -- fpでバッファの中で1つ前に開いたファイルを開く
        vim.keymap.set("n", "fp", function()
            vim.cmd(":Buffers<CR><CR>")
        end)

        -- flで開いているファイルの文字列検索を開く
        vim.keymap.set("n", "fl", function()
            vim.cmd(":BLines<CR>")
        end)

        -- fmでマーク検索を開く
        vim.keymap.set("n", "fm", function()
            vim.cmd(":Marks<CR>")
        end)

        -- fhでファイル閲覧履歴検索を開く
        vim.keymap.set("n", "fh", function()
            vim.cmd(":History<CR>")
        end)

        -- fcでコミット履歴検索を開く
        vim.keymap.set("n", "fc", function()
            vim.cmd(":Commits<CR>")
        end)
    end,
    cond = false,
}
