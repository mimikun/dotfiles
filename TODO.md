# TODO

## Unissued and Not Updated

## Issue list

### 127. [i3の設定](https://github.com/mimikun/dotfiles/issues/127)

i3-wmの様々なツールを導入する

スクショ
[flameshot-org/flameshot: Powerful yet simple to use screenshot software :camera_flash:](https://github.com/flameshot-org/flameshot)
[Flameshot - ArchWiki](https://wiki.archlinux.org/title/Flameshot#Troubleshooting)

### 120. [Improve LOCALBIN/vup for arch linux](https://github.com/mimikun/dotfiles/issues/120)

### 119. [Add kabegami tools](https://github.com/mimikun/dotfiles/issues/119)

e.g. `./kabegami.sh setup`

### 118. [Improve .Xresources config for archlinux](https://github.com/mimikun/dotfiles/issues/118)

### 117. [Improve .chezmoiignore for arch linux"](https://github.com/mimikun/dotfiles/issues/117)

### 116. [Improve utils/update.sh for arch linux](https://github.com/mimikun/dotfiles/issues/116)

isAzusa(ArchLinux), isWsl フラグを作成する
フラグにより更新するファイルを変える

### 115. [Improve paleovim config for archlinux](https://github.com/mimikun/dotfiles/issues/115)

### 114. [Improve wezterm config for archlinux](https://github.com/mimikun/dotfiles/issues/114)

### 113. [Improve zsh config for archlinux](https://github.com/mimikun/dotfiles/issues/113)

### 112. [Improve bash config for archlinux](https://github.com/mimikun/dotfiles/issues/112)

### 111. [Improve fcitx5 config for archlinux](https://github.com/mimikun/dotfiles/issues/111)

### 110. [Improve powershell config for archlinux](https://github.com/mimikun/dotfiles/issues/110)

### 109. [Improve nyagos config for archlinux](https://github.com/mimikun/dotfiles/issues/109)

### 108. [Improve nvim config for archlinux](https://github.com/mimikun/dotfiles/issues/108)

### 107. [Improve gh config for archlinux](https://github.com/mimikun/dotfiles/issues/107)

### 106. [Improve fish config for archlinux](https://github.com/mimikun/dotfiles/issues/106)

### 105. [azusa(ArchLinuxマシン)設定](https://github.com/mimikun/dotfiles/issues/105)

- [ ] M-S-sでスクショメニューを出すようにしたい
    - 矩形選択、全画面、アプリケーションウィンドウのみ等
- [ ] M-lで画面ロックできるようにしたい
- [ ] M-dで出るランチャーをいい感じにしたい
    - PT RunやAlfredのように
- [ ] シャットダウン、再起動、スリープできるGUIがほしい
- [ ] GUIで無線有線LANの設定をしたい
- [ ] 顔認証したい
- [ ] ログイン画面のフォントが小さいので大きくしたい
- [x] Google日本語入力が使いたい
    - mozc？
- [ ] SKKが使いたい
- [ ] dotfilesにarch linuxの分岐を追加
- [ ] Mをホールドでwhich-keyやショートカットガイドっぽいの出す
    - vim-jpで聞いたところによると無いっぽい、壁紙に書いておくのが良さそう。
- [ ] ThinkPad本体のキーボードで音量操作や輝度操作をやりたい
- [ ] 指紋認証したい
    - できるのか不明、できなさそう
- [ ] 画面下部ステータスバーをいい感じにしたい
- [ ] (mozc限定)変換無変換でIMEのオンオフ

### 59. [Fix `~/.cache/fish/config.fish` error](https://github.com/mimikun/dotfiles/issues/59)

会社PCで発生

再現条件は不明


```fish
~/.cache/fish/config.fish (line 55): 'end' outside of a block
    end;
    ^~^
from sourcing file ~/.cache/fish/config.fish
        called on line 227 of file ~/.config/fish/config.fish
from sourcing file ~/.config/fish/config.fish
        called during startup
source: Error while reading file '/home/username/.cache/fish/config.fish'
Welcome to fish, the friendly interactive shell
Type `help` for instructions on how to use fish
HOST_NAME ~>
```

### 57. [nyagos設定](https://github.com/mimikun/dotfiles/issues/57)

### 56. [yankしたときクリップボードに情報が入らない](https://github.com/mimikun/dotfiles/issues/56)

地味にストレス

https://github.com/mimikun/dotfiles/tree/v2023.10.09 では発生しておらず https://github.com/mimikun/dotfiles/tree/v2023.10.10 で発生するようになった

原因は多分間違いなくこれ

https://github.com/mimikun/dotfiles/commit/47cd26149b5cc07039cb200e28179e6327dd567f

### 54. [neovimのPluginを分類する](https://github.com/mimikun/dotfiles/issues/54)

[yutkat/my-neovim-pluginlist](https://github.com/yutkat/my-neovim-pluginlist) の分類を参考にする

### 51. [`vim-skk/skkeleton` の設定](https://github.com/mimikun/dotfiles/issues/51)

https://github.com/vim-skk/skkeleton の設定

### 49. [neovimの起動速度の記録を取りたい](https://github.com/mimikun/dotfiles/issues/49)

issueにbotで追記していきたい

参考: https://github.com/rhysd/action-setup-vim

### 48. [Dockerでdotfilesを試せる環境を作る](https://github.com/mimikun/dotfiles/issues/48)

bitwarden連携がうまく動くか心配

### 47. [fzf.lua を書く](https://github.com/mimikun/dotfiles/issues/47)

READMEはこれ

- https://github.com/ibhagwan/fzf-lua/blob/main/README.md

### 20. [fzf-vim.lua を全部Luaで書く](https://github.com/mimikun/dotfiles/issues/20)

#### ピッチ

fzf-vim.lua を全部Luaで書く

#### モチベーション\n\n全部Luaで書いてあるとナウい

### 12. [tree-sitter-powershellの設定を書く](https://github.com/mimikun/dotfiles/issues/12)

#### ピッチ

[PowerShell/tree-sitter-PowerShell](https://github.com/PowerShell/tree-sitter-PowerShell) の設定を書く

#### モチベーション

PowerShellスクリプトがneovimでハイライトされると嬉しい
