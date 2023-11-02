"-------------------------------
" neoclide/coc.nvim
"-------------------------------

" <Tab>で候補をナビゲート
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" <Tab>で次、<S+Tab>で前
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" coc.nvim settings
let g:coc_global_extensions = [
    \'coc-css',
    \'coc-deepl',
    \'coc-deno',
    \'coc-eslint',
    \'coc-explorer',
    \'coc-git',
    \'coc-highlight',
    \'coc-html',
    \'coc-html-css-support',
    \'coc-jest',
    \'coc-json',
    \'coc-lists',
    \'coc-lua',
    \'coc-marketplace',
    \'coc-pairs',
    \'@raidou/coc-prettier-v3',
    \'coc-pyright',
    \'coc-rust-analyzer',
    \'coc-solargraph',
    \'coc-toml',
    \'coc-tsserver',
    \'coc-yaml',
    \'@yaegassy/coc-black-formatter',
    \'@yaegassy/coc-mypy',
    \'@yaegassy/coc-nginx',
    \'coc-zig',
\]
