--ref: https://oroques.dev/2020/01/07/neovim-05.html
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- 参考: https://trap.jp/post/524/
-- マウス操作を有効にする
opt.mouse = 'a'

-- 使用可能性のある改行コードを指定
opt.fileformats = 'unix', 'dos', 'mac'

-- ファイル読み込むときのエンコード
-- 左から順に試す
opt.fileencodings = 'ucs-bombs', 'utf-8', 'euc-jp', 'cp932'

--" 全角文字の表示に2文字分使うようにする
opt.ambiwidth = 'double'

-- スワップファイルを作成しないようにする
opt.swapfile = false

-- :q したときにバッファを消さず隠して保持しておくようにする
opt.hidden = true

-- 行番号を表示する
opt.number = true

-- 空白文字を可視化する
opt.list = true
opt.listchars = {tab = '>-', trail = '*', nbsp = '+'}

-- 良い感じにインデントしてくれるようにする
opt.smartindent = true

-- ビープ音を画面フラッシュで代替
opt.visualbell = true

-- TABキーを押したときにtab文字ではなくスペースを入力するようにする
opt.expandtab = true

-- TABキーを押したときのインデントのスペース個数を指定する
opt.tabstop = 4

-- 自動インデントのスペース個数を指定する
opt.shiftwidth = 4

---- 検索関係の設定
-- 大文字小文字の区別をなくす
opt.ignorecase = true

-- 検索単語に大文字が含まれていた場合特別な意味があると解釈させる
opt.smartcase = true

-- 一番下の単語まで行ったら一番上に戻るようにさせる
opt.wrapscan = true

---- lightline.vim 用
-- 常にタブページのラベル(各タブのファイル名)を表示
opt.showtabline = 2

-- モードの表記を消す
opt.showmode = false

--ある行の行頭から前の行の行末に移動したり, 逆に行末から次の行の行頭に移動できるようにする
-- BackSpaceキー, SPACEキーで有効になる
-- <(←キー),>(→キー)はNORMALモード及びVISUALモードで各キーにこの機能を割り当て
-- [(←キー),](→キー)はINSERTモード(置換含む)でこの機能を有効にする
opt.whichwrap = 'b', 's', '<', '>', '[', ']'

-- 反映時間を短くする(デフォルトは4000ms)
opt.updatetime = 250

-- ヘルプ日本語化
opt.helplang = "ja", "en"

-- シンタックスハイライトを有効にする
cmd('syntax enable')

-- カラースキームを設定
-- $XDG_CONFIG_HOME/nvim/colors 以下にある
--cmd('colorscheme monokai')

-- True Colorでのシンタックスハイライト
opt.termguicolors = true
cmd([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
cmd([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])

-- Pythonのパスを指定
g.python_host_prog = '~/.asdf/shims/python2'
g.python3_host_prog = '~/.asdf/shims/python3'

-- NeoVimの無名レジスタ(yでヤンクしたときにコピーする先)とOSのクリップボードを結びつける
-- 低スぺック環境ではオフにする
cmd([[set clipboard+=unnamedplus]])
