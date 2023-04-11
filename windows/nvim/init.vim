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

" Providerを無効化
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0

filetype plugin indent on
