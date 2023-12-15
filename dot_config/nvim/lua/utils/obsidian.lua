local M = {}

local day_sec = 86400
local month_sec = 2592000
local year_sec = 31536000
local tmp_today = os.date("*t", os.time())

-- Summarizing various elements of today's date
---@type table
local today_tbl = {
    year = tmp_today.year,
    month = tmp_today.month,
    day = tmp_today.day,
    -- zero padding
    z_month = string.format("%02d", tmp_today.month),
    -- zero padding
    z_day = string.format("%02d", tmp_today.day),
}

--------------------------------------------------------
-- 999_Templates/dailyNoteTemplateFromObsidianNvim.md --
--------------------------------------------------------

-- This today
-- YYYY年MM月DD日
---@return string
M.today = function()
    local year = today_tbl.year
    local month = today_tbl.z_month
    local day = today_tbl.z_day
    return (year .. "年" .. month .. "月" .. day .. "日")
end

-- YYYY/MM/DD
---@return string
M.today_fm_1 = function()
    local year = today_tbl.year
    local month = today_tbl.z_month
    local day = today_tbl.z_day
    return (year .. "/" .. month .. "/" .. day)
end

-- YYYY/M/D
---@return string
M.today_fm_2 = function()
    local year = today_tbl.year
    local month = today_tbl.month
    local day = today_tbl.day
    return (year .. "/" .. month .. "/" .. day)
end

-- YYYY年M月D日
---@return string
M.today_fm_3 = function()
    local year = today_tbl.year
    local month = today_tbl.month
    local day = today_tbl.day
    return (year .. "年" .. month .. "月" .. day .. "日")
end

-- YYYY-MM-DD
---@return string
M.today_fm_4 = function()
    local year = today_tbl.year
    local month = today_tbl.z_month
    local day = today_tbl.z_day
    return (year .. "-" .. month .. "-" .. day)
end

-- YYYY-M-D
---@return string
M.today_fm_5 = function()
    local year = today_tbl.year
    local month = today_tbl.month
    local day = today_tbl.day
    return (year .. "-" .. month .. "-" .. day)
end

-- Tomorrow
---@return string
M.tomorrow = function()
    local tmp = os.date("*t", os.time() + day_sec)
    local year = tmp.year
    local month = string.format("%02d", tmp.month)
    local day = string.format("%02d", tmp.day)
    return (year .. "年" .. month .. "月" .. day .. "日")
end

-- Yesterday
---@return string
M.yesterday = function()
    local tmp = os.date("*t", os.time() - day_sec)
    local year = tmp.year
    local month = string.format("%02d", tmp.month)
    local day = string.format("%02d", tmp.day)
    return (year .. "年" .. month .. "月" .. day .. "日")
end

----------------------------------------------------------
-- 999_Templates/monthlyNoteTemplateFromObsidianNvim.md --
----------------------------------------------------------

-- This month
-- YYYY年MM月
---@return string
M.current_month = function()
    local year = today_tbl.year
    local month = today_tbl.z_month
    return (year .. "年" .. month .. "月")
end

-- YYYY/MM
---@return string
M.month_fm_1 = function()
    local year = today_tbl.year
    local month = today_tbl.z_month
    return (year .. "/" .. month)
end

-- YYYY/M
---@return string
M.month_fm_2 = function()
    local year = today_tbl.year
    local month = today_tbl.month
    return (year .. "/" .. month)
end

-- YYYY-MM
---@return string
M.month_fm_3 = function()
    local year = today_tbl.year
    local month = today_tbl.z_month
    return (year .. "-" .. month)
end

-- YYYY-M
---@return string
M.month_fm_4 = function()
    local year = today_tbl.year
    local month = today_tbl.month
    return (year .. "-" .. month)
end

-- YYYY年M月
---@return string
M.month_fm_5 = function()
    local year = today_tbl.year
    local month = today_tbl.month
    return (year .. "年" .. month .. "月")
end

-- Next month
---@return string
M.next_month = function()
    local tmp = os.date("*t", os.time() + month_sec + day_sec)
    local year = tmp.year
    local month = string.format("%02d", tmp.month)
    return (year .. "年" .. month .. "月")
end

-- Last month
---@return string
M.last_month = function()
    local tmp = os.date("*t", os.time() - month_sec)
    local year = tmp.year
    local month = string.format("%02d", tmp.month)
    return (year .. "年" .. month .. "月")
end

---------------------------------------------------------
-- 999_Templates/yearlyNoteTemplateFromObsidianNvim.md --
---------------------------------------------------------

-- This year
-- YYYY年
---@return string
M.current_year = function()
    local year = today_tbl.year
    return (year .. "年")
end

-- Next year
---@return string
M.next_year = function()
    local tmp = os.date("*t", os.time() + year_sec)
    local year = tmp.year
    return (year .. "年")
end

-- Last year
---@return string
M.last_year = function()
    local tmp = os.date("*t", os.time() - year_sec)
    local year = tmp.year
    return (year .. "年")
end

return M
