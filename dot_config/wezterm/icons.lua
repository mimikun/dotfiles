---@diagnostic disable
-- https://www.nerdfonts.com/cheat-sheet
-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html?h=icons
local wezterm = require("wezterm")
local nf = wezterm.nerdfonts

---- zoomed 🔎
local cod_zoom_in = nf.cod_zoom_in
local oct_zoom_in = nf.oct_zoom_in

---- Left Status
-- HEADER_KEY_NORMAL 
local md_alphabetical = nf.md_alphabetical
local md_alphabetical_variant = nf.md_alphabetical_variant
-- HEADER_LEADER 
local md_keyboard = nf.md_keyboard
local md_keyboard_outline = nf.md_keyboard_outline
local md_keyboard_variant = nf.md_keyboard_variant
local fa_keyboard_o = nf.fa_keyboard_o
-- HEADER_IME あ
local md_syllabary_hiragana = nf.md_syllabary_hiragana

---- Right Status
-- HEADER_HOST 
--[[
nf-md-monitor
]]
-- HEADER_CWD 
--[[
nf-custom-folder_open
nf-fa-folder_open
nf-md-folder_open
nf-fa-folder_open_o
nf-cod-folder_opened
]]
-- HEADER_DATE 󱪺
--[[
nf-cod-calendar
nf-fa-calendar
nf-md-calendar
nf-fa-calendar_o
]]
-- HEADER_TIME 
--[[
nf-md-clock
nf-oct-clock
nf-seti-clock
nf-fa-clock_o
nf-md-clock_outline
nf-oct-clock_fill
]]
-- HEADER_BATTERY 
--[[

]]
