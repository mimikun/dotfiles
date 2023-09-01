-- 参考: https://karukichi-blog.netlify.app/blogs/wezterm
local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- デバッグ用
local function debug_log_print()
    --wezterm.log_info("Default hyperlink rules " .. wezterm.default_hyperlink_rules())
    --wezterm.log_info("Default ssh domains" .. wezterm.default_ssh_domains())
    --wezterm.log_info("Default wsl domains" .. wezterm.default_wsl_domains())
    wezterm.log_info("Config Dir " .. wezterm.config_dir)
    wezterm.log_info("Config file " .. wezterm.config_file)
    wezterm.log_info("Version " .. wezterm.version)
    wezterm.log_info("Exe dir " .. wezterm.executable_dir)
    wezterm.log_info("Hostname " .. wezterm.hostname())
    wezterm.log_info("Running under wsl" .. tostring(wezterm.running_under_wsl()))
    config.debug_key_events = true
end

-- os.dateによって返却された数値から曜日を判定し、漢字に変換する
-- (曜日, 1–7, 日曜日が 1)
local day_of_week_ja = { "日", "月", "火", "水", "木", "金", "土" }

-- 年月日と時間をステータスバーに表示する
-- ノートPCの場合はバッテリーも表示する
-- ウィンドウが最初に表示されてから1秒後に開始され、1秒に1回トリガーされるイベント
wezterm.on("update-status", function(window, pane)
    -- 日付のtableを作成する方法じゃないと曜日の取得がうまくいかなかった
    -- NOTE: https://www.lua.org/pil/22.1.html
    local wday = os.date("*t").wday
    -- 指定子の後に半角スペースをつけないと正常に表示されなかった
    local wday_ja = string.format("(%s)", day_of_week_ja[wday])
    local date = wezterm.strftime("📆 %Y-%m-%d " .. wday_ja .. " ⏰ %H:%M:%S")

    -- バッテリー型PCのみ
    local bat = ""

    for _, b in ipairs(wezterm.battery_info()) do
        local battery_state_of_charge = b.state_of_charge * 100
        local battery_icon = ""

        if battery_state_of_charge >= 80 then
            battery_icon = "🌕  "
        elseif battery_state_of_charge >= 70 then
            battery_icon = "🌖  "
        elseif battery_state_of_charge >= 60 then
            battery_icon = "🌖  "
        elseif battery_state_of_charge >= 50 then
            battery_icon = "🌗  "
        elseif battery_state_of_charge >= 40 then
            battery_icon = "🌗  "
        elseif battery_state_of_charge >= 30 then
            battery_icon = "🌘  "
        elseif battery_state_of_charge >= 20 then
            battery_icon = "🌘  "
        else
            battery_icon = "🌑  "
        end

        bat = string.format("%s%.0f%% ", battery_icon, battery_state_of_charge)
    end

    window:set_right_status(wezterm.format({
        { Text = date .. "  " .. bat },
    }))
end)

-- タブの表示をカスタマイズ
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local tab_index = tab.tab_index + 1

    -- Copymode時のみ、"Copymode..."というテキストを表示
    if tab.is_active and string.match(tab.active_pane.title, "Copy mode:") ~= nil then
        return string.format(" %d %s ", tab_index, "Copy mode...")
    end

    return string.format(" %d ", tab_index)
end)

-- 色の設定
local base_colors = {
    dark = "#172331",
    yellow = "#ffe64d",
}

config.colors = {
    cursor_bg = base_colors["yellow"],
    split = "#6fc3df",
    -- the foreground color of selected text
    selection_fg = base_colors["dark"],
    -- the background color of selected text
    selection_bg = base_colors["yellow"],
    tab_bar = {
        background = base_colors["dark"],
        -- The active tab is the one that has focus in the window
        active_tab = {
            bg_color = "aliceblue",
            fg_color = base_colors["dark"],
        },
    },
}

-- キーバインドの設定
-- leader keyを CTRL + qにマッピング
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
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

-- フォントを FiraCode Nerd Font Mono にする
config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = 450, stretch = "Normal", style = "Normal" })
-- フォントサイズを 12 にする
config.font_size = 12
-- 行の高さを 1 にする
config.line_height = 1
-- カラースキームを GitHub Dark にする
config.color_scheme = "GitHub Dark"
config.use_fancy_tab_bar = false
-- IME を使用する
config.use_ime = true
-- アクティブではないペインの彩度を変更しない
config.inactive_pane_hsb = {
    saturation = 1,
    brightness = 1,
}

local hostname = wezterm.hostname()
local wsl_domain
if hostname == "TanakaPC" then
    -- Work PC
    wsl_domain = "WSL:Ubuntu-20.04"
else
    -- Home PC
    wsl_domain = "WSL:Ubuntu"
end

-- デフォルトで開かれるものを決める
config.default_domain = wsl_domain

-- ランチャーメニュー(+ ボタン右クリックで出る) を設定する
config.launch_menu = {
    {
        label = "WSL Ubuntu",
        domain = {
            DomainName = wsl_domain,
        },
    },
    {
        label = "Windows PowerShell v5",
        domain = {
            DomainName = "local",
        },
        args = { "powershell.exe" },
    },
    {
        label = "Windows PowerShell v7",
        domain = {
            DomainName = "local",
        },
        args = { "pwsh.exe" },
    },
    {
        label = "Windows cmd.exe",
        domain = {
            DomainName = "local",
        },
    },
}

-- 画面の初期サイズを決める
-- https://wezfurlong.org/wezterm/config/lua/config/initial_rows.html
-- https://wezfurlong.org/wezterm/config/lua/config/initial_cols.html
config.initial_rows = 30
config.initial_cols = 120

-- Unicode のバージョンを指定する
-- https://wezfurlong.org/wezterm/config/lua/config/unicode_version.html
--config.unicode_version = 9

-- Print debug log
debug_log_print()

return config
