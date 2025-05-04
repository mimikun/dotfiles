# Zebar config

## Devices

- Wakamo
    - OS: Windows 11 Pro
    - Desktop
    - Performance: High
- Azusa
    - OS: Arch Linux
    - Type: Laptop
    - Performance: Middle
- Work-PC
    - OS: Windows 10 Pro
    - Type: Desktop
    - Performance: Low

## Using Providers

Can be used on almost all OS, with some exceptions.

- Audio
    - Windows Only
- Battery
- CPU
- Date
- Disk
- GlazeWM
    - Windows Only
- Host
- IP
- Keyboard
    - Windows Only
- Komorebi
    - Windows Only
- Media
    - Windows Only
- Memory
- Network
- Systray
    - Windows Only
- Weather

## Config

Create it based on the `i3status-rust` settings.

### Wakamo

- CPU
- Disk
- Memory
- Audio
- Date

### Azusa

- Battery
- CPU
- Disk
- Memory
- Audio
- Date

### Work-PC

- CPU
- Disk
- Memory
- Date

## `i3status-rust` config

```toml
icons_format = "{icon}"

[theme]
theme = "solarized-dark"
[theme.overrides]
idle_bg = "#123456"
idle_fg = "#abcdef"

[icons]
icons = "awesome4"
[icons.overrides]
bat = ["|E|", "|_|", "|=|", "|F|"]
bat_charging = "|^| "

[[block]]
block = "battery"
format = " $icon $percentage "

[[block]]
block = "cpu"

[[block]]
block = "disk_space"
path = "/"
info_type = "available"
alert_unit = "GB"
interval = 20
warning = 20.0
alert = 10.0
format = " $icon root: $available.eng(w:2) "

[[block]]
block = "memory"
format = " $icon $mem_total_used_percents.eng(w:2) "
format_alt = " $icon_swap $swap_used_percents.eng(w:2) "

[[block]]
block = "sound"
[[block.click]]
button = "left"
cmd = "pavucontrol"

[[block]]
block = "time"
interval = 5
#format = " $timestamp.datetime(f:'%a %d/%m %R') "
format = " $timestamp.datetime(f:'%Y年%m月%d日(%a) %R') "
```

