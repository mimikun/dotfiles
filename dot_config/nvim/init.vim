" ファイルの種類毎に設定ファイルを記述できるようにする
filetype plugin indent off
""""""" 参考: https://trap.jp/post/524/
" マウス操作を有効にする
set mouse=a
" シンタックスハイライトを有効にする
syntax enable
" カラースキームを設定
" $XDG_CONFIG_HOME/nvim/colors 以下にある
colorscheme monokai
" 使用可能性のある改行コードを指定
set fileformats=unix,dos,mac
" True Colorでのシンタックスハイライト
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" ファイル読み込むときのエンコード
"左から順に試す
set fileencodings=ucs-bombs,utf-8,euc-jp,cp932
" 全角文字の表示に2文字分使うようにする
set ambiwidth=double
" スワップファイルを作成しないようにする
set noswapfile
" :q したときにバッファを消さず隠して保持しておくようにする
set hidden
" 行番号を表示する
set number
" 空白文字を可視化する
set list
set listchars=tab:>-,trail:*
" 良い感じにインデントしてくれるようにする
set smartindent
" ビープ音を画面フラッシュで代替
set visualbell
" ファイル上の1行が画面上では複数行にわたっているとき
" NORMALモード時の j/kで見た目通りに移動できるようにする
nnoremap j gj
nnoremap k gk
" TABキーを押したときにtab文字ではなくスペースを入力するようにする
set expandtab
" TABキーを押したときのインデントのスペース個数を指定する
set tabstop=4
" 自動インデントのスペース個数を指定する
set shiftwidth=4
""" 検索関係の設定
" 大文字小文字の区別をなくす
set ignorecase
" 検索単語に大文字が含まれていた場合特別な意味があると解釈させる
set smartcase
" 一番下の単語まで行ったら一番上に戻るようにさせる
set wrapscan
" ESCキー連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
"ある行の行頭から前の行の行末に移動したり, 逆に行末から次の行の行頭に移動できるようにする
" BackSpaceキー, SPACEキーで有効になる
" <(←キー),>(→キー)はNORMALモード及びVISUALモードで各キーにこの機能を割り当て
" [(←キー),](→キー)はINSERTモード(置換含む)でこの機能を有効にする
set whichwrap=b,s,<,>,[,]
" GUI VIM用の設定
imap <S-CR> <End><CR>
imap <C-S-CR> <Up><End><CR>
nnoremap <S-CR> mzo<ESC>`z
nnoremap <C-S-CR> mzO<ESC>`z
" Pythonのパスを指定
let g:python_host_prog = expand('~/.asdf/shims/python2')
let g:python3_host_prog = expand('~/.asdf/shims/python3')
" Ctrl+Wを押した後にnを押すことで新規タブを開けるようにする
nnoremap <C-w>n <Esc>:enew<Return>
" NeoVimの無名レジスタ(yでヤンクしたときにコピーする先)とOSのクリップボードを結びつける
" 低スぺック環境ではオフにする
set clipboard+=unnamedplus
" win32yankの設定
nnoremap <silent> <Space>y :.w !win32yank.exe -i<CR><CR>
vnoremap <silent> <Space>y :w !win32yank.exe -i<CR><CR>
nnoremap <silent> <Space>p :r !win32yank.exe -o<CR>
vnoremap <silent> <Space>p :r !win32yank.exe -o<CR>
"" lightline.vim 用
" 常にタブページのラベル(各タブのファイル名)を表示
set showtabline=2
" モードの表記を消す
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
Plug 'alker0/chezmoi.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'vim-denops/denops.vim'
Plug 'Omochice/dps-translate-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lambdalisue/fern.vim', {'branch': 'main'}
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/gin.vim'
Plug 'thinca/vim-quickrun'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'thinca/vim-scouter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'airblade/vim-gitgutter'
Plug 'rcabralc/monokai-airline.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'nastevens/vim-cargo-make'
Plug 'cespare/vim-toml'
Plug 'nastevens/vim-duckscript'
Plug 'NoahTheDuke/vim-just'
Plug 'IndianBoy42/tree-sitter-just'
Plug 'vim-jp/vimdoc-ja'
Plug 'imsnif/kdl.vim'
Plug 'mattn/calendar-vim'

" Initialize plugin system
call plug#end()

"" coc.nvim settings
""" <Tab>で候補をナビゲート
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

""" <Tab>で次、<S+Tab>で前
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

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

"" coc.nvim settings
let g:coc_global_extensions = [
      \'coc-html', 
      \'coc-jedi', 
      \'coc-solargraph', 
      \'coc-git', 
      \'coc-json', 
      \'coc-rust-analyzer' 
      \'coc-zls' 
\]

"" vim.airline settings
let g:airline_theme = 'monokai'

"" fern.vim settings
" 参考: https://qiita.com/youichiro/items/b4748b3e96106d25c5bc#%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%84%E3%83%AA%E3%83%BC%E3%82%92%E8%A1%A8%E7%A4%BA%E3%81%99%E3%82%8B
" Ctrl+nでファイルツリーを表示/非表示する
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
" アイコン表示を有効にする
let g:fern#renderer = 'nerdfont'
" アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
" ドットファイルを表示させる
let g:fern#default_hidden=1

"" vim-gitgutter
" g]で前の変更箇所へ移動する
nnoremap g[ :GitGutterPrevHunk<CR>
" g[で次の変更箇所へ移動する
nnoremap g] :GitGutterNextHunk<CR>
" ghでdiffをハイライトする
nnoremap gh :GitGutterLineHighlightsToggle<CR>
" gpでカーソル行のdiffを表示する
nnoremap gp :GitGutterPreviewHunk<CR>
" 記号の色を変更する
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red

"" 反映時間を短くする(デフォルトは4000ms)
set updatetime=250

"" fzf.vim
" Ctrl+pでファイル検索を開く
" git管理されていれば:GFiles、そうでなければ:Filesを実行する
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles
  endif
endfun
nnoremap <C-p> :call FzfOmniFiles()<CR>

" Ctrl+gで文字列検索を開く
" <S-?>でプレビューを表示/非表示する
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
\ <bang>0)
nnoremap <C-g> :Rg<CR>

" frでカーソル位置の単語をファイル検索する
nnoremap fr vawy:Rg <C-R>"<CR>
" frで選択した単語をファイル検索する
xnoremap fr y:Rg <C-R>"<CR>

" fbでバッファ検索を開く
nnoremap fb :Buffers<CR>
" fpでバッファの中で1つ前に開いたファイルを開く
nnoremap fp :Buffers<CR><CR>
" flで開いているファイルの文字列検索を開く
nnoremap fl :BLines<CR>
" fmでマーク検索を開く
nnoremap fm :Marks<CR>
" fhでファイル閲覧履歴検索を開く
nnoremap fh :History<CR>
" fcでコミット履歴検索を開く
nnoremap fc :Commits<CR>

"" vim-markdown
" 折りたたみ無効化
let g:vim_markdown_folding_disabled = 1
" YAMLフロントマターの強調表示
let g:vim_markdown_frontmatter = 1

"" dps-translate-vim
let g:dps_translate_source = "en"
let g:dps_translate_target = "ja"

"" ヘルプ日本語化
set helplang=ja,en

filetype plugin indent on
