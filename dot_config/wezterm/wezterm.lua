-- 参考: https://karukichi-blog.netlify.app/blogs/wezterm
local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

local global = require("global")
local hostname = global.hostname
local is_wsl = global.is_wsl
local is_human_rights = global.is_human_rights

-- デバッグ用
local function debug_log_print()
    --wezterm.log_info("Default hyperlink rules " .. wezterm.default_hyperlink_rules())
    --wezterm.log_info("Default ssh domains" .. wezterm.default_ssh_domains())
    --wezterm.log_info("Default wsl domains" .. wezterm.default_wsl_domains())
    wezterm.log_info("Config Dir " .. wezterm.config_dir)
    wezterm.log_info("Config file " .. wezterm.config_file)
    wezterm.log_info("Version " .. wezterm.version)
    wezterm.log_info("Exe dir " .. wezterm.executable_dir)
    wezterm.log_info("Hostname " .. hostname)
    wezterm.log_info("Running under wsl" .. tostring(is_wsl))
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

        -- Use https://www.nerdfonts.com/cheat-sheet
        if battery_state_of_charge >= 90 then
            -- nf-md-battery
            battery_icon = "󰁹  "
        elseif battery_state_of_charge >= 80 then
            -- nf-md-battery_90
            battery_icon = "󰂂  "
        elseif battery_state_of_charge >= 70 then
            -- nf-md-battery_80
            battery_icon = "󰂁  "
        elseif battery_state_of_charge >= 60 then
            -- nf-md-battery_70
            battery_icon = "󰂀  "
        elseif battery_state_of_charge >= 50 then
            -- nf-md-battery_60
            battery_icon = "󰁿  "
        elseif battery_state_of_charge >= 40 then
            -- nf-md-battery_50
            battery_icon = "󰁾  "
        elseif battery_state_of_charge >= 30 then
            -- nf-md-battery_40
            battery_icon = "󰁽  "
        elseif battery_state_of_charge >= 20 then
            -- nf-md-battery_30
            battery_icon = "󰁼  "
        elseif battery_state_of_charge >= 10 then
            -- nf-md-battery_20
            battery_icon = "󰁻  "
        else
            -- nf-md-battery_outline
            battery_icon = "󰂎  "
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

local colors = require("colors")
-- カラースキームを GitHub Dark にする
config.color_scheme = colors.color_scheme
config.colors = colors.colors

-- キーバインドの設定
local keymaps = require("keymaps")
config.leader = keymaps.leader
config.keys = keymaps.keys

-- フォントを FiraCode Nerd Font Mono にする
config.font = wezterm.font("FiraCode Nerd Font Mono", { weight = 450, stretch = "Normal", style = "Normal" })
-- フォントサイズを 12 にする
config.font_size = 12
-- 行の高さを 1 にする
config.line_height = 1
config.use_fancy_tab_bar = false
-- IME を使用する
config.use_ime = true
-- アクティブではないペインの彩度を変更しない
config.inactive_pane_hsb = {
    saturation = 1,
    brightness = 1,
}

local wsl_domain
if is_human_rights then
    -- Home PC
    wsl_domain = "WSL:Ubuntu"
else
    -- Work PC
    wsl_domain = "WSL:Ubuntu-20.04"
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
    {
        label = "nyagos - Nihongo Yet Another GOing Shell",
        domain = {
            DomainName = "local",
        },
        args = { "nyagos.exe" },
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
