vim9script

#-------------------------------"
# airblade/vim-gitgutter
#-------------------------------"
# g]で前の変更箇所へ移動する
nnoremap g[ :GitGutterPrevHunk<CR>

# g[で次の変更箇所へ移動する
nnoremap g] :GitGutterNextHunk<CR>

# ghでdiffをハイライトする
nnoremap gh :GitGutterLineHighlightsToggle<CR>

# gpでカーソル行のdiffを表示する
nnoremap gp :GitGutterPreviewHunk<CR>

# 記号の色を変更する
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red

# 反映時間を短くする(デフォルトは4000ms)
set updatetime=250

defcompile
