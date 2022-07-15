filetype plugin indent off

set mouse=a
syntax enable
colorscheme monokai
set fileformats=unix,dos,mac
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set fileencodings=ucs-bombs,utf-8,euc-jp,cp932
set ambiwidth=double
set noswapfile
set hidden
set number
set list
set listchars=tab:>-,trail:*
set smartindent
set visualbell
nnoremap j gj
nnoremap k gk
set expandtab
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set wrapscan
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set whichwrap=b,s,<,>,[,]
imap <S-CR> <End><CR>
imap <C-S-CR> <Up><End><CR>
nnoremap <S-CR> mzo<ESC>`z
nnoremap <C-S-CR> mzO<ESC>`z
let g:python_host_prog = expand('~/.asdf/shims/python2')
let g:python3_host_prog = expand('~/.asdf/shims/python3')
nnoremap <C-w>n <Esc>:enew<Return>
" win32yank settings
"set clipboard+=unnamedplus
"nnoremap <silent> <Space>y :.w !win32yank.exe -i<CR><CR>
"vnoremap <silent> <Space>y :w !win32yank.exe -i<CR><CR>
"nnoremap <silent> <Space>p :r !win32yank.exe -o<CR>
"vnoremap <silent> <Space>p :r !win32yank.exe -o<CR>
set showtabline=2
set noshowmode

"" vim-plug auto download
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" vim-plug settings
call plug#begin()
" Make sure you use single quotes
" e.g.
" Plug 'github-username/plugin-name'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'vim-denops/denops.vim'
Plug 'vim-denops/denops-helloworld.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/fern.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/gin.vim'
Plug 'thinca/vim-quickrun'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'thinca/vim-scouter'

" Initialize plugin system
call plug#end()

"" coc.nvim settings
"ref: https://momozo.tech/2021/03/09/coc-nvim%E3%82%92%E4%BD%BF%E3%81%84vim%E3%81%AE%E8%87%AA%E5%8B%95%E8%A3%9C%E5%AE%8C%E3%82%92%E5%BC%B7%E5%8C%96%E3%81%99%E3%82%8B/
""" <Tab>で候補をナビゲート
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
""" <Tab>で次、<S+Tab>で前
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" nvim-treesitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {
    }
  },
  ensure_installed = {
    'bash',
    'c',
    'c_sharp',
    'cmake',
    'cpp',
    'css',
    'dockerfile',
    'fish',
    'go',
    'gomod',
    'gowork',
    'help',
    'html',
    'java',
    'javascript',
    'jsdoc',
    'json',
    'json5',
    'latex',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'ninja',
    'nix',
    'ocaml',
    'ocaml_interface',
    'python',
    'regex',
    'rst',
    'ruby',
    'rust',
    'scss',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vue',
    'yaml',
  }
}
EOF

let g:coc_global_extensions = [
      \'coc-html', 
      \'coc-jedi', 
      \'coc-solargraph', 
      \'coc-git'
\]

filetype plugin indent on
