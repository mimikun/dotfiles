" ファイルの種類毎に設定ファイルを記述できるようにする
filetype plugin indent off

runtime! vim/core/options.vim
runtime! vim/core/settings.vim
"-------------------------------"
"  Plugins
"-------------------------------"

" Automatic installation on startup
let s:jetpackfile = expand('<sfile>:p:h') .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

"-------------------------------"
" Plugins
"-------------------------------"
packadd vim-jetpack
call jetpack#begin()
" vim-jetpack itself
Jetpack 'tani/vim-jetpack', {'opt': 1}
" TODO: カテゴリ分けして整理する
" fern.vim
Jetpack 'lambdalisue/fern.vim'
Jetpack 'lambdalisue/fern-git-status.vim'
Jetpack 'lambdalisue/nerdfont.vim'
Jetpack 'lambdalisue/fern-renderer-nerdfont.vim'
Jetpack 'lambdalisue/glyph-palette.vim'

" fzf.vim
Jetpack 'junegunn/fzf'
Jetpack 'junegunn/fzf.vim'

" denops.vim
Jetpack 'vim-denops/denops.vim'
Jetpack 'Omochice/dps-translate-vim'
Jetpack 'skanehira/denops-docker.vim'
Jetpack 'willelz/skk-tutorial.vim'

" status line
Jetpack 'vim-airline/vim-airline'
Jetpack 'vim-airline/vim-airline-themes'

" syntax highlights
Jetpack 'nastevens/vim-duckscript'
Jetpack 'imsnif/kdl.vim'
Jetpack 'cespare/vim-toml'
Jetpack 'NoahTheDuke/vim-just'
Jetpack 'nastevens/vim-cargo-make'
Jetpack 'alker0/chezmoi.vim'
Jetpack 'ron-rs/ron.vim'

" utilities
Jetpack 'vim-jp/vimdoc-ja'
Jetpack 'mattn/calendar-vim'
Jetpack 'dstein64/vim-startuptime'
Jetpack 'thinca/vim-scouter'
Jetpack 'thinca/vim-quickrun'
Jetpack 'lambdalisue/gin.vim'
Jetpack 'airblade/vim-gitgutter'
Jetpack 'godlygeek/tabular'
Jetpack 'preservim/vim-markdown'
Jetpack 'tpope/vim-surround'
Jetpack 'vim-skk/skkeleton'
Jetpack 'liuchengxu/vim-which-key'

" colorschemes
Jetpack 'ghifarit53/tokyonight-vim'
Jetpack 'cormacrelf/vim-colors-github'
Jetpack 'voidekh/kyotonight.vim'
Jetpack 'sainnhe/sonokai'
Jetpack 'loctvl842/monokai-pro.nvim'
Jetpack 'crusoexia/vim-monokai'


" coc.nvim
Jetpack 'neoclide/coc.nvim', {'branch': 'release'}

call jetpack#end()

" Automatic plugin installation on startup
for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor

runtime! vim/keymaps/keymap.vim

runtime! vim/plugins/*.vim

runtime! vim/core/colorscheme.vim

" 末尾なのでこれを入れる
filetype plugin indent on
