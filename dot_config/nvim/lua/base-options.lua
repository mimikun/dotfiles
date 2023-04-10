-- 参考: https://trap.jp/post/524/
-- マウス操作を有効にする
vim.opt.mouse = "a"

-- 使用可能性のある改行コードを指定
vim.opt.fileformats = { "unix", "dos", "mac" }

-- ファイル読み込むときのエンコード
-- 左から順に試す
vim.opt.fileencodings = "utf-8", "cp932", "ucs-bombs", "euc-jp"

--" 全角文字の表示に2文字分使うようにする
vim.opt.ambiwidth = "double"

-- スワップファイルを作成しないようにする
vim.opt.swapfile = false

-- :q したときにバッファを消さず隠して保持しておくようにする
vim.opt.hidden = true

-- 行番号を表示する
vim.opt.number = true

-- 空白文字を可視化する
vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "*", nbsp = "+", space = "⋅" }

-- 良い感じにインデントしてくれるようにする
vim.opt.smartindent = true

-- ビープ音を画面フラッシュで代替
vim.opt.visualbell = true

-- TABキーを押したときにtab文字ではなくスペースを入力するようにする
vim.opt.expandtab = true

-- TABキーを押したときのインデントのスペース個数を指定する
vim.opt.tabstop = 4

-- 自動インデントのスペース個数を指定する
vim.opt.shiftwidth = 4

---- 検索関係の設定
-- 大文字小文字の区別をなくす
vim.opt.ignorecase = true

-- 検索単語に大文字が含まれていた場合特別な意味があると解釈させる
vim.opt.smartcase = true

-- 一番下の単語まで行ったら一番上に戻るようにさせる
vim.opt.wrapscan = true

---- lightline.vim 用
-- 常にタブページのラベル(各タブのファイル名)を表示
vim.opt.showtabline = 2

-- モードの表記を消す
vim.opt.showmode = false

--ある行の行頭から前の行の行末に移動したり, 逆に行末から次の行の行頭に移動できるようにする
-- BackSpaceキー, SPACEキーで有効になる
-- <(←キー),>(→キー)はNORMALモード及びVISUALモードで各キーにこの機能を割り当て
-- [(←キー),](→キー)はINSERTモード(置換含む)でこの機能を有効にする
vim.opt.whichwrap = "b", "s", "<", ">", "[", "]"

-- 反映時間を短くする(デフォルトは4000ms)
vim.opt.updatetime = 250

-- ヘルプ日本語化
vim.opt.helplang = "ja", "en"

-- シンタックスハイライトを有効にする
vim.cmd("syntax enable")

-- True Colorでのシンタックスハイライト
vim.opt.termguicolors = true
vim.cmd([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
vim.cmd([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])

-- Pythonのパスを指定
vim.g.python_host_prog = "~/.asdf/shims/python2"
vim.g.python3_host_prog = "~/.asdf/shims/python3"

-- Perl Providerを無効にする
vim.g.loaded_perl_provider = 0

-- NeoVimの無名レジスタ(yでヤンクしたときにコピーする先)とOSのクリップボードを結びつける
-- 低スぺック環境ではオフにする
--vim.opt.clipboard = 'unnamedplus'
