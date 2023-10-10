local fzf_opts = { ["--scrollbar"] = "█" }
local is_git = require("utils.func").is_git

return {
    "ibhagwan/fzf-lua",
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
        local fzf_lua = require("fzf-lua")

        fzf_lua.setup({
            winopts = {
                preview = { scrollbar = "float" },
            },
        })
        -- Ctrl+pでファイル検索を開く
        -- git管理されていればgit_files
        -- そうでなければfilesを実行する
        vim.keymap.set("n", "<C-p>", function()
            if is_git then
                fzf_lua.git_files({ fzf_opts = fzf_opts })
            else
                fzf_lua.files({ fzf_opts = fzf_opts })
            end
        end, {})

        -- Ctrl+gで文字列検索を開く
        -- <S-?>でプレビューを表示/非表示する?
        vim.keymap.set("n", "<C-g>", function()
            fzf_lua.grep_project({ fzf_opts = fzf_opts })
        end, {})

        -- Rgの書き換え?
        --vim.cmd([[
        --        command! -bang -nargs=* Rg
        --        \ call fzf#vim#grep(
        --        \ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
        --        \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
        --        \ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
        --        \ <bang>0)
        --    ]])

        -- frでカーソル位置の単語をファイル検索する
        vim.keymap.set("n", "fr", function()
            fzf_lua.grep_cword({ fzf_opts = fzf_opts })
        end, {})

        -- frで選択した単語をファイル検索する
        -- TODO: 対応するコマンドを見つける

        --vim.keymap.set("x", "fr y", function()
        --    fzf_lua.grep_project()
        --end, {})

        -- fbでバッファ検索を開く
        vim.keymap.set("n", "fb", function()
            fzf_lua.buffers({ fzf_opts = fzf_opts })
        end, {})

        -- fpでバッファの中で1つ前に開いたファイルを開く
        -- TODO: 対応するコマンドを見つける

        --vim.keymap.set("n", "fp", function ()
        --    vim.cmd(":Buffers<CR><CR>")
        --end, {})

        -- flで開いているファイルの文字列検索を開く
        vim.keymap.set("n", "fl", function()
            fzf_lua.blines({ fzf_opts = fzf_opts })
        end, {})

        -- fmでマーク検索を開く
        vim.keymap.set("n", "fm", function()
            fzf_lua.marks({ fzf_opts = fzf_opts })
        end, {})

        -- fhでファイル閲覧履歴検索を開く
        vim.keymap.set("n", "fh", function()
            fzf_lua.oldfiles({ fzf_opts = fzf_opts })
        end, {})

        -- fcでコミット履歴検索を開く
        vim.keymap.set("n", "fc", function()
            fzf_lua.git_commits({ fzf_opts = fzf_opts })
        end, {})
    end,
    cond = false,
}
