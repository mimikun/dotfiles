return {
    "ibhagwan/fzf-lua",
    -- TODO: setting
    -- https://github.com/ibhagwan/fzf-lua/blob/main/README.md

    --lazy = false,
    --event = "VeryLazy",
    keys = {
        { "<C-p>", desc = "Open file search" },
        { "<C-g>", desc = "Open string search" },
    },
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
        -- うまく動かない
        local is_git = function()
            if vim.fn.system("git status"):find("fatal") == 1 then
                return false
            else
                return true
            end
        end

        -- workaround
        vim.opt.ambiwidth = "single"

        local fzf_lua = require("fzf-lua")
        fzf_lua.setup({})
        -- Ctrl+pでファイル検索を開く
        -- git管理されていればgit_files
        -- そうでなければfilesを実行する
        vim.keymap.set("n", "<C-p>", function()
            if is_git then
                fzf_lua.files()
            else
                fzf_lua.git_files()
            end
        end, {})

        -- Ctrl+gで文字列検索を開く
        vim.keymap.set("n", "<C-g>", function()
            fzf_lua.grep_project()
        end, {})

        -- <S-?>でプレビューを表示/非表示する
        --vim.cmd([[
        --        command! -bang -nargs=* Rg
        --        \ call fzf#vim#grep(
        --        \ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
        --        \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
        --        \ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
        --        \ <bang>0)
        --    ]])
        --vim.keymap.set("n", "<C-g>", function ()
        --vim.cmd(":Rg<CR>")
        --end, {})

        -- frでカーソル位置の単語をファイル検索する
        vim.keymap.set("n", "fr", function()
            fzf_lua.grep_cword()
        end, {})

        -- frで選択した単語をファイル検索する
        vim.keymap.set("x", "fr y", function()
            fzf_lua.grep_project()
        end, {})

        -- fbでバッファ検索を開く
        --vim.keymap.set("n", "fb", function ()
        --    vim.cmd(":Buffers<CR>")
        --end, {})

        -- fpでバッファの中で1つ前に開いたファイルを開く
        --vim.keymap.set("n", "fp", function ()
        --    vim.cmd(":Buffers<CR><CR>")
        --end, {})

        -- flで開いているファイルの文字列検索を開く
        vim.keymap.set("n", "fl", function()
            fzf_lua.blines()
        end, {})

        -- fmでマーク検索を開く
        vim.keymap.set("n", "fm", function()
            fzf_lua.marks()
        end, {})

        -- fhでファイル閲覧履歴検索を開く
        vim.keymap.set("n", "fh", function()
            fzf_lua.oldfiles()
        end, {})

        -- fcでコミット履歴検索を開く
        vim.keymap.set("n", "fc", function()
            fzf_lua.git_commits()
        end, {})
    end,
    cond = false,
}
