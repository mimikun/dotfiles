local coc_extensions = {
    "coc-css",
    "coc-deepl",
    "coc-deno",
    "coc-eslint",
    "coc-explorer",
    "coc-git",
    "coc-highlight",
    "coc-html",
    "coc-html-css-support",
    "coc-jest",
    "coc-json",
    "coc-lists",
    "coc-lua",
    "coc-marketplace",
    "coc-pairs",
    --変なポップアップが出てきてつらいので消す
    --"coc-powershell",
    --エタったのか更新されていないので別のを使う
    "@raidou/coc-prettier-v3",
    --"coc-prettier",
    "coc-pyright",
    "coc-rust-analyzer",
    "coc-snippets",
    "coc-solargraph",
    --変なポップアップが出てきてつらいので消す
    --"coc-spell-checker",
    "coc-toml",
    "coc-tsserver",
    "coc-yaml",
    "@yaegassy/coc-black-formatter",
    "@yaegassy/coc-mypy",
    "@yaegassy/coc-nginx",
    "coc-zig",
}

return {
    "neoclide/coc.nvim",
    lazy = false,
    branch = "release",
    build = ":CocUpdate",
    config = function()
        -- <tab> と<Shift-tab> でナビゲートするやつ
        vim.cmd([[
                function! CheckBackspace() abort
                    let col = col('.') - 1
                    return !col || getline('.')[col - 1]  =~ '\s'
                endfunction
            ]])

        -- Insert <tab> when previous text is space, refresh completion if not.
        vim.cmd([[
                inoremap <silent><expr> <TAB>
                    \ coc#pum#visible() ? coc#pum#next(1):
                    \ CheckBackspace() ? "\<Tab>" :
                    \ coc#refresh()
            ]])
        vim.cmd([[inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]])

        -- VSCodeライクなタブ補完
        --vim.cmd([[
        --[[
            inoremap <silent><expr> <TAB>
                \ coc#pum#visible() ? coc#_select_confirm() :
                \ coc#expandableOrJumpable() ?
                \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
                \ CheckBackspace() ? "\<TAB>" :
                \ coc#refresh()
            ]]
        --]])
        --vim.cmd([[
        --[[
            function! CheckBackspace() abort
                let col = col('.') - 1
                return !col || getline('.')[col - 1]  =~# '\s'
            endfunction
            ]]
        --]])
        --vim.g.coc_snippet_next = '<tab>'

        vim.g.coc_global_extensions = coc_extensions
    end,
    --cond = false,
}
