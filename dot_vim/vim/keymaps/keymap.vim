vim9script
#-------------------------------
# keymaps
#-------------------------------

# ファイル上の1行が画面上では複数行にわたっているとき
# NORMALモード時の j/kで見た目通りに移動できるようにする
nnoremap j gj
nnoremap k gk

# win32yankの設定
nnoremap <silent> <Space>y :.w !win32yank.exe -i<CR><CR>
vnoremap <silent> <Space>y :w !win32yank.exe -i<CR><CR>
nnoremap <silent> <Space>p :r !win32yank.exe -o<CR>
vnoremap <silent> <Space>p :r !win32yank.exe -o<CR>

# Ctrl+Wを押した後にnを押すことで新規タブを開けるようにする
nnoremap <C-w>n <Esc>:enew<Return>

# GUI VIM用の設定
imap <S-CR> <End><CR>
imap <C-S-CR> <Up><End><CR>
nnoremap <S-CR> mzo<ESC>`z
nnoremap <C-S-CR> mzO<ESC>`z

# ESCキー連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

defcompile
