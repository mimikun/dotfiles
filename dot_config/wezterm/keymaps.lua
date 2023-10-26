-- 参考: https://karukichi-blog.netlify.app/blogs/wezterm
local wezterm = require("wezterm")
local M = {}

-- キーバインドの設定
-- leader keyを CTRL + qにマッピング
M.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 1000 }
M.keys = {
    -- LEADER + mでLauncher Menuを開く
    {
        key = "m",
        mods = "LEADER",
        action = wezterm.action.ShowLauncher,
    },
    -- LEADER + tでタブを新規作成
    {
        key = "t",
        mods = "LEADER",
        action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
    },
    -- LEADER + wでタブを閉じる
    {
        key = "w",
        mods = "LEADER",
        action = wezterm.action({ CloseCurrentTab = { confirm = true } }),
    },
    -- LEADER + numberでタブの切り替え
    {
        key = "1",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 0 }),
    },
    {
        key = "2",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 1 }),
    },
    {
        key = "3",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 2 }),
    },
    {
        key = "4",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 3 }),
    },
    {
        key = "5",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 4 }),
    },
    {
        key = "6",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 5 }),
    },
    {
        key = "7",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 6 }),
    },
    {
        key = "8",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 7 }),
    },
    {
        key = "9",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 8 }),
    },
    -- LEADER + - でPANEを水平方向に開く
    {
        key = "-",
        mods = "LEADER",
        action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
    },
    -- LEADER + \\ でPANEを縦方向に開く
    {
        -- | は入力がうまくいかないのでバックスラッシュのキーに置き換える
        key = "\\",
        mods = "LEADER",
        action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
    },
    -- LEADER + hjklでPANEを移動する
    {
        key = "h",
        mods = "LEADER",
        action = wezterm.action({ ActivatePaneDirection = "Left" }),
    },
    {
        key = "l",
        mods = "LEADER",
        action = wezterm.action({ ActivatePaneDirection = "Right" }),
    },
    {
        key = "k",
        mods = "LEADER",
        action = wezterm.action({ ActivatePaneDirection = "Up" }),
    },
    {
        key = "j",
        mods = "LEADER",
        action = wezterm.action({ ActivatePaneDirection = "Down" }),
    },
    -- LEADER + x でPANEを閉じる
    {
        key = "x",
        mods = "ALT",
        action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
    },
    -- ALT + hjklでペインの幅を調整する
    {
        key = "h",
        mods = "ALT",
        action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }),
    },
    {
        key = "l",
        mods = "ALT",
        action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }),
    },
    {
        key = "k",
        mods = "ALT",
        action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }),
    },
    {
        key = "j",
        mods = "ALT",
        action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }),
    },
    -- SHIFT + Enter でQuickSelect・・・画面に表示されている文字をクイックにコピペできる機能
    {
        key = "Enter",
        mods = "SHIFT",
        action = "QuickSelect",
    },
}

return M
