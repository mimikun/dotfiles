-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  use 'alker0/chezmoi.vim'
  use 'vim-denops/denops.vim'
  use 'Omochice/dps-translate-vim'
  use 'junegunn/fzf.vim'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'lambdalisue/gin.vim'
  use 'thinca/vim-quickrun'
  use 'thinca/vim-scouter'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'lambdalisue/fern-git-status.vim'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use 'lambdalisue/glyph-palette.vim'
  use 'airblade/vim-gitgutter'
  use 'rcabralc/monokai-airline.vim'
  use 'godlygeek/tabular'
  use 'preservim/vim-markdown'
  use 'nastevens/vim-cargo-make'
  use 'cespare/vim-toml'
  use 'nastevens/vim-duckscript'
  use 'NoahTheDuke/vim-just'
  use 'IndianBoy42/tree-sitter-just'
  use 'vim-jp/vimdoc-ja'
  use 'imsnif/kdl.vim'
  use 'mattn/calendar-vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'lambdalisue/fern.vim', branch = 'main' }
  use {
    'pappasam/coc-jedi', branch = 'main', run = 'yarn install --frozen-lockfile && yarn build'
  }
  use {
    'junegunn/fzf', run = function() vim.fn['fzf#install()'](0) end
  }

  -- Lazy loading:
  -- Load on specific commands
  --use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  --use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  --[[
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]--'
  --}

  -- Plugins can have dependencies on other plugins
  --[[
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }
  ]]

  -- Plugins can also depend on rocks from luarocks.org:
  --[[
  use {
    'my/supercoolplugin',
    rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  }
  ]]

  -- You can specify rocks in isolation
  --use_rocks 'penlight'
  --use_rocks {'lua-resty-http', 'lpeg'}

  -- Local plugins can be included
  --use '~/projects/personal/hover.nvim'

  -- Plugins can have post-install/update hooks
  --use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Post-install/update hook with neovim command
  --use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Post-install/update hook with call of vimscript function with argument
  --use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- Use specific branch, dependency and run lua file after load
  --[[
  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  ]]

  -- Use dependency and run lua function after load
  --[[
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  ]]

  -- You can specify multiple plugins in a single call
  --use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- You can alias plugin names
  --use {'dracula/vim', as = 'dracula'}
end)
