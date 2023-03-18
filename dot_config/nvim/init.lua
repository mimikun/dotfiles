--ref: https://oroques.dev/2020/01/07/neovim-05.html
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- ファイルの種類毎に設定ファイルを記述できるようにする
cmd('filetype plugin indent off')

-- 参考: https://trap.jp/post/524/
-- マウス操作を有効にする
opt.mouse = 'a'

-- シンタックスハイライトを有効にする
cmd('syntax enable')

-- カラースキームを設定
-- $XDG_CONFIG_HOME/nvim/colors 以下にある
cmd('colorscheme monokai')

-- 使用可能性のある改行コードを指定
opt.fileformats = 'unix', 'dos', 'mac'

-- True Colorでのシンタックスハイライト
opt.termguicolors = true
cmd([[let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"]])
cmd([[let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"]])

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

-- ファイル上の1行が画面上では複数行にわたっているとき
-- NORMALモード時の j/kで見た目通りに移動できるようにする
-- ref:
-- https://zenn.dev/slin/articles/2020-11-03-neovim-lua2#%E3%83%9E%E3%83%83%E3%83%94%E3%83%B3%E3%82%B0
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

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

-- ESCキー連打でハイライト解除
--cmd('nmap <Esc><Esc> :nohlsearch<CR><Esc>')
vim.keymap.set('', '<Esc><Esc>', ':nohlsearch<CR><Esc>')

--ある行の行頭から前の行の行末に移動したり, 逆に行末から次の行の行頭に移動できるようにする
-- BackSpaceキー, SPACEキーで有効になる
-- <(←キー),>(→キー)はNORMALモード及びVISUALモードで各キーにこの機能を割り当て
-- [(←キー),](→キー)はINSERTモード(置換含む)でこの機能を有効にする
opt.whichwrap = 'b', 's', '<', '>', '[', ']'

-- GUI VIM用の設定
--cmd('imap <S-CR> <End><CR>')
vim.keymap.set('i', '<S-CR>', '<End><CR>')
--cmd('imap <C-S-CR> <Up><End><CR>')
vim.keymap.set('i', '<C-S-CR>', '<Up><End><CR>')
vim.keymap.set('n', '<S-CR>', 'mzo<ESC>`z')
vim.keymap.set('n', '<C-S-CR>', 'mzO<ESC>`z')

-- Pythonのパスを指定
g.python_host_prog = '~/.asdf/shims/python2'
g.python3_host_prog = '~/.asdf/shims/python3'
--cmd([[let g:python_host_prog = expand('~/.asdf/shims/python2')]])
--cmd([[let g:python3_host_prog = expand('~/.asdf/shims/python3')]])


-- Ctrl+Wを押した後にnを押すことで新規タブを開けるようにする
vim.keymap.set('n', '<C-w>n', '<Esc>:enew<Return>')

-- NeoVimの無名レジスタ(yでヤンクしたときにコピーする先)とOSのクリップボードを結びつける
-- 低スぺック環境ではオフにする
cmd([[set clipboard+=unnamedplus]])
--opt.clipboard:append { 'unnamedplus '}

-- win32yankの設定
--cmd('nnoremap <silent> <Space>y :.w !win32yank.exe -i<CR><CR>')
vim.keymap.set('n', '<silent> <Space>y', ':.w !win32yank.exe -i<CR><CR>')
--cmd('vnoremap <silent> <Space>y :w !win32yank.exe -i<CR><CR>')
vim.keymap.set('v', '<silent> <Space>y', ':w !win32yank.exe -i<CR><CR>')
--cmd('nnoremap <silent> <Space>p :r !win32yank.exe -o<CR>')
vim.keymap.set('n', '<silent> <Space>p', ':r !win32yank.exe -o<CR>')
--cmd('vnoremap <silent> <Space>p :r !win32yank.exe -o<CR>')
vim.keymap.set('v', '<silent> <Space>p', ':r !win32yank.exe -o<CR>')

---- lightline.vim 用
-- 常にタブページのラベル(各タブのファイル名)を表示
opt.showtabline = 2

-- モードの表記を消す
opt.showmode = false

-- packer.nvim のファイルを読み込む
require('plugins')

-- coc.nvim settings
-- <tab> と<Shift-tab> でナビゲートするやつ
cmd([[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
]])

-- Insert <tab> when previous text is space, refresh completion if not.
cmd([[
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
]])
cmd([[inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]])

-- VSCodeライクなタブ補完
--cmd([[
--[[
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()
]]
--)
--cmd([[
--[[
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]]
--)
--cmd([[let g:coc_snippet_next = '<tab>']])

-- nvim-treesitter config
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

-- coc.nvim settings
g.coc_global_extensions = {
    'coc-html',
    'coc-jedi',
    'coc-solargraph',
    'coc-git',
    'coc-json',
    'coc-rust-analyzer',
    'coc-snippets'
}

-- vim.airline settings
g.airline_theme = 'monokai'

-- fern.vim settings
-- ref: https://qiita.com/youichiro/items/b4748b3e96106d25c5bc#%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%84%E3%83%AA%E3%83%BC%E3%82%92%E8%A1%A8%E7%A4%BA%E3%81%99%E3%82%8B
-- Ctrl+nでファイルツリーを表示/非表示する
vim.keymap.set('n', '<C-n>', ':Fern . -reveal=% -drawer -toggle -width=40<CR>')

-- アイコン表示を有効にする
cmd([[let g:fern#renderer = 'nerdfont']])

-- アイコンに色をつける
cmd([[
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
]])
-- ドットファイルを表示させる
cmd([[let g:fern#default_hidden=1]])

-- vim-gitgutter
-- g]で前の変更箇所へ移動する
vim.keymap.set('n', 'g[', ':GitGutterPrevHunk<CR>')

-- g[で次の変更箇所へ移動する
vim.keymap.set('n', 'g]', ':GitGutterNextHunk<CR>')

-- ghでdiffをハイライトする
vim.keymap.set('n', 'gh', ':GitGutterLineHighlightsToggle<CR>')

-- gpでカーソル行のdiffを表示する
vim.keymap.set('n', 'gp', ':GitGutterPreviewHunk<CR>')

-- 記号の色を変更する
cmd([[highlight GitGutterAdd ctermfg=green]])
cmd([[highlight GitGutterChange ctermfg=blue]])
cmd([[highlight GitGutterDelete ctermfg=red]])

-- 反映時間を短くする(デフォルトは4000ms)
opt.updatetime = 250

-- fzf.vim
-- Ctrl+pでファイル検索を開く
-- git管理されていれば:GFiles、そうでなければ:Filesを実行する
cmd([[
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles
  endif
endfun
]])

vim.keymap.set('n', '<C-p>', ':call FzfOmniFiles()<CR>')

-- Ctrl+gで文字列検索を開く
-- <S-?>でプレビューを表示/非表示する
cmd([[
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
\ <bang>0)
]])

vim.keymap.set('n', '<C-g>', ':Rg<CR>')

-- frでカーソル位置の単語をファイル検索する
vim.keymap.set('n', 'fr', 'vawy:Rg <C-R>"<CR>')

-- frで選択した単語をファイル検索する
--cmd([[xnoremap fr y:Rg <C-R>"<CR>]])
vim.keymap.set('x', 'fr y', ':Rg <C-R>"<CR>')

-- fbでバッファ検索を開く
vim.keymap.set('n', 'fb', ':Buffers<CR>')

-- fpでバッファの中で1つ前に開いたファイルを開く
vim.keymap.set('n', 'fp', ':Buffers<CR><CR>')

-- flで開いているファイルの文字列検索を開く
vim.keymap.set('n', 'fl', ':BLines<CR>')

-- fmでマーク検索を開く
vim.keymap.set('n', 'fm', ':Marks<CR>')

-- fhでファイル閲覧履歴検索を開く
vim.keymap.set('n', 'fh', ':History<CR>')

-- fcでコミット履歴検索を開く
vim.keymap.set('n', 'fc', ':Commits<CR>')

-- vim-markdown
-- 折りたたみ無効化
g.vim_markdown_folding_disabled = 1

-- YAMLフロントマターの強調表示
g.vim_markdown_frontmatter = 1

-- dps-translate-vim
g.dps_translate_source = "en"
g.dps_translate_target = "ja"

-- ヘルプ日本語化
opt.helplang = "ja", "en"

cmd('filetype plugin indent on')
