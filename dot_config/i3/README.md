# i3-wm-cheetsheet

## 画面ロック

- Win + Alt + L

## 音量上げ

- FX
## 音量下げ

- FX

## スピーカーミュート

- FX

## マイクミュート

- FX

## ターミナル起動

- Win + Enter

## ウィンドウを閉じる

- Win + Shift + Q

## rofiランチャーを開く

- Win + D

## 左のウィンドウにフォーカスを当てる

- Win + H
- Win + ←

## 下のウィンドウにフォーカスを当てる

- Win + J
- Win + ↓

## 上のウィンドウにフォーカスを当てる

- Win + K
- Win + ↑

## 右のウィンドウにフォーカスを当てる

- Win + L
- Win + →

## フォーカスの当たったウィンドウを左に移動する

- Win + Shift + H
- Win + Shift + ←

## フォーカスの当たったウィンドウを下に移動する

- Win + Shift + J
- Win + Shift + ↓

## フォーカスの当たったウィンドウを上に移動する

- Win + Shift + K
- Win + Shift + ↑

## フォーカスの当たったウィンドウを右に移動する

- Win + Shift + L
- Win + Shift + →

## 縦に分割する

- Win + I

# 横に分割する

- Win + V

# フルスクリーンをトグルする

- Win + F

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
#bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"
bindsym $mod+Shift+e exec --no-startup-id "bash ~/.config/rofi/powermenu/type-6/powermenu.sh"

# resize window (you can also use the mouse for that)
mode "resize" {
    # These bindings trigger as soon as you enter the resize mode

    # Pressing left will shrink the window’s width.
    # Pressing right will grow the window’s width.
    # Pressing up will shrink the window’s height.
    # Pressing down will grow the window’s height.
    bindsym h resize shrink width 10 px or 10 ppt
    bindsym j resize grow height 10 px or 10 ppt
    bindsym k resize shrink height 10 px or 10 ppt
    bindsym l resize grow width 10 px or 10 ppt

    # same bindings, but for the arrow keys
    bindsym Left resize shrink width 10 px or 10 ppt
    bindsym Down resize grow height 10 px or 10 ppt
    bindsym Up resize shrink height 10 px or 10 ppt
    bindsym Right resize grow width 10 px or 10 ppt

    # back to normal: Enter or Escape or $mod+r
    bindsym Return mode "default"
    bindsym Escape mode "default"
    bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

# TODO: Open File-Browser
# Mod + e

# TODO: Open ScreenShot Menu
# Mod + Shift + s
- Win + 
