vim9script

#-------------------------------"
# lambdalisue/fern.vim
#-------------------------------"
# Ctrl+nでファイルツリーを表示/非表示する
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>

# アイコン表示を有効にする
g:fern#renderer = 'nerdfont'

# アイコンに色をつける
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

# ドットファイルを表示させる
g:fern#default_hidden = 1

defcompile
