vim9script

#-------------------------------
#  Base settings
#-------------------------------
# True Colorでのシンタックスハイライト
set termguicolors
#let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
#let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

# マウス操作を有効にする
set mouse=a

# シンタックスハイライトを有効にする
syntax enable

# 使用可能性のある改行コードを指定
set fileformats=unix,dos,mac

# ファイル読み込むときのエンコード
# 左から順に試す
set fileencodings=utf-8,cp932,ucs-bombs,euc-jp

# 全角文字の表示に2文字分使うようにする
set ambiwidth=double

# スワップファイルを作成しないようにする
set noswapfile

# :q したときにバッファを消さず隠して保持しておくようにする
# Linuxの場合のみ設定
if has('unix')
    set hidden
endif

# 行番号を表示する
set number

# 空白文字を可視化する
set list
set listchars=tab:>-,trail:*,nbsp:+,space:⋅

# 良い感じにインデントしてくれるようにする
set smartindent

# ビープ音を画面フラッシュで代替
set visualbell

# TABキーを押したときにtab文字ではなくスペースを入力するようにする
set expandtab

# TABキーを押したときのインデントのスペース個数を指定する
set tabstop=4
# 自動インデントのスペース個数を指定する
set shiftwidth=4

# 検索関係の設定
# 大文字小文字の区別をなくす
set ignorecase

# 検索単語に大文字が含まれていた場合特別な意味があると解釈させる
set smartcase

# 一番下の単語まで行ったら一番上に戻るようにさせる
set wrapscan

# Pythonのパスを指定
g:python_host_prog = expand('~/.asdf/shims/python2')
g:python3_host_prog = expand('~/.asdf/shims/python3')

# ある行の行頭から前の行の行末に移動したり, 逆に行末から次の行の行頭に移動できるようにする
# BackSpaceキー, SPACEキーで有効になる
# <(←キー),>(→キー)はNORMALモード及びVISUALモードで各キーにこの機能を割り当て
# [(←キー),](→キー)はINSERTモード(置換含む)でこの機能を有効にする
set whichwrap=b,s,<,>,[,]

# NeoVimの無名レジスタ(yでヤンクしたときにコピーする先)とOSのクリップボードを結びつける
# 低スぺック環境ではオフにする
if hostname() == "TanakaPC"
    set clipboard+=unnamedplus
endif

defcompile
