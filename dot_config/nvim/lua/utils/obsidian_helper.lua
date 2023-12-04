local M = {}

local day_sec = 86400
local month_sec = 2592000
local year_sec = 31536000

-- 今日
---@return table
M.today = function()
    local tmp = os.date("*t", os.time())
    local today = {
        year = tmp.year,
        month = tmp.month,
        day = tmp.day,
    }
    return today
end

-- {{date:YYYY/MM/DD}}
---@return string
M.daily_fm_1 = function ()
end

-- {{date:YYYY/M/D}}
---@return string
M.daily_fm_2 = function ()
end

-- {{date:YYYY年MM月DD日}}
---@return string
M.daily_fm_3 = function ()
end

-- {{date:YYYY年M月D日}}
---@return string
M.daily_fm_4 = function ()
end

-- {{date:YYYY-MM-DD}}
---@return string
M.daily_fm_5 = function ()
end

-- {{date:YYYY-M-D}}
---@return string
M.daily_fm_6 = function ()
end

-- 翌日
---@return table
M.tomorrow = function()
    local tmp = os.date("*t", os.time() + day_sec)
    local tomorrow = {
        year = tmp.year,
        month = tmp.month,
        day = tmp.day,
    }
    return tomorrow
end

-- 前日
---@return table
M.yesterday = function()
    local tmp = os.date("*t", os.time() - day_sec)
    local yesterday = {
        year = tmp.year,
        month = tmp.month,
        day = tmp.day,
    }
    return yesterday
end

-- 今月
---@return table
M.current_month = function()
    local tmp = os.date("*t", os.time())
    local current_month = {
        year = tmp.year,
        month = tmp.month,
    }
    return current_month
end

-- {{date:YYYY/MM}}
---@return string
M.monthly_fm_1 = function ()
end

-- {{date:YYYY/M}}
---@return string
M.monthly_fm_2 = function ()
end

-- {{date:YYYY-MM}}
---@return string
M.monthly_fm_3 = function ()
end

-- {{date:YYYY-M}}
---@return string
M.monthly_fm_4 = function ()
end

-- {{date:YYYY年MM月}}
---@return string
M.monthly_fm_5 = function ()
end

-- {{date:YYYY年M月}}
---@return string
M.monthly_fm_6 = function ()
end

-- {{date:YYYYMM}}
---@return string
M.monthly_fm_7 = function ()
end

-- {{date:YYYYM}}
---@return string
M.monthly_fm_8 = function ()
end

-- 翌月
---@return table
M.next_month = function()
    local tmp = os.date("*t", os.time() + month_sec + day_sec)
    local next_month = {
        year = tmp.year,
        month = tmp.month,
    }
    return next_month
end

-- 前月
---@return table
M.last_month = function()
    local tmp = os.date("*t", os.time() - month_sec)
    local last_month = {
        year = tmp.year,
        month = tmp.month,
    }
    return last_month
end

-- 今年
---@return table
M.current_year = function()
    local tmp = os.date("*t", os.time())
    local current_year = {
        year = tmp.year,
    }
    return current_year
end

-- 翌年
---@return table
M.next_year = function()
    local tmp = os.date("*t", os.time() + year_sec)
    local next_year = {
        year = tmp.year,
    }
    return next_year
end

-- 前年
---@return table
M.last_year = function()
    local tmp = os.date("*t", os.time() - year_sec)
    local last_year = {
        year = tmp.year,
    }
    return last_year
end

return M
