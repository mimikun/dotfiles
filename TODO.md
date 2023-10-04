# TODO

## No issue numbers

- Fix nvim checkhealth error

```txt
Python 3 provider (optional) ~
- Using: g:python3_host_prog = "~/.asdf/shims/python3"
- Executable: /home/yuto/.asdf/shims/python3
- Python version: 3.12.0
- pynvim version: Traceback (most recent call last):
    File "<string>", line 1, in <module>
    File "/home/yuto/.asdf/installs/python/3.12.0/lib/python3.12/site-packages/neovim/__init__.py", line 5, in <module>
      import pynvim
    File "/home/yuto/.asdf/installs/python/3.12.0/lib/python3.12/site-packages/pynvim/__init__.py", line 9, in <module>
      from pynvim.api import Nvim, NvimError
    File "/home/yuto/.asdf/installs/python/3.12.0/lib/python3.12/site-packages/pynvim/api/__init__.py", line 7, in <module>
      from pynvim.api.buffer import Buffer
    File "/home/yuto/.asdf/installs/python/3.12.0/lib/python3.12/site-packages/pynvim/api/buffer.py", line 2, in <module>
      from pynvim.api.common import Remote
    File "/home/yuto/.asdf/installs/python/3.12.0/lib/python3.12/site-packages/pynvim/api/common.py", line 6, in <module>
      from pynvim.compat import unicode_errors_default
    File "/home/yuto/.asdf/installs/python/3.12.0/lib/python3.12/site-packages/pynvim/compat.py", line 5, in <module>
      from imp import find_module as original_find_module
  ModuleNotFoundError: No module named 'imp'
- OK Latest pynvim is installed.
```

### 55. Fix nvim healthcheck warning

https://github.com/mimikun/dotfiles/issues/55

会社PCで発生

```
WARNING No clipboard tool found. Clipboard registers (`"+` and `"*`) will not work.
```

### 54. neovimのPluginを分類する

https://github.com/mimikun/dotfiles/issues/54

[yutkat/my-neovim-pluginlist](https://github.com/yutkat/my-neovim-pluginlist) の分類を参考にする

### 53. `lspconfig` を使ってみたい

https://github.com/mimikun/dotfiles/issues/53

`coc.nvim` のかわりに使う

### 52. PowerShellの起動速度UP

https://github.com/mimikun/dotfiles/issues/52

cache使うテクでうまいこといけないか試す

### 51. `vim-skk/skkeleton` の設定

https://github.com/mimikun/dotfiles/issues/51

https://github.com/vim-skk/skkeleton の設定

### 49. neovimの起動速度の記録を取りたい

https://github.com/mimikun/dotfiles/issues/49

issueにbotで追記していきたい

参考: https://github.com/rhysd/action-setup-vim

### 48. Dockerでお試しできる環境を作る

https://github.com/mimikun/dotfiles/issues/48

bitwarden連携がうまく動くか心配

### 47. fzf.lua を書く

https://github.com/mimikun/dotfiles/issues/47

READMEはこれ

https://github.com/ibhagwan/fzf-lua/blob/main/README.md

### 41. telescope-nvim.lua を書く

https://github.com/mimikun/dotfiles/issues/41

まだ書けてないところがある

### 30. neovimのoptionsを更新する

https://github.com/mimikun/dotfiles/issues/30

もっとたくさんのオプションがあるのでそれらをすべて書く

### 28. vimrc分割

https://github.com/mimikun/dotfiles/issues/28

vimrcを分割して見やすくしたい

### 20. fzf-vim.lua を全部Luaで書く

https://github.com/mimikun/dotfiles/issues/20

モチベーション: 全部Luaで書いてあるとナウい

#### ref

https://github.com/junegunn/fzf.vim/blob/master/README.md

### 12. tree-sitter-powershellの設定を書く

https://github.com/mimikun/dotfiles/issues/12

https://github.com/mimikun/tree-sitter-PowerShell/tree/test を使って書く

PowerShellスクリプトがneovimでハイライトされると嬉しい

#### ref

https://github.com/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins

https://github.com/pldmgg/nvim_windows_config/blob/2056d4c25aa40e5511d95bc6137cbcd9c5801283/init.lua#L7
