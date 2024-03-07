local utils = {}

---@type number
local day_sec = 86400
---@type number
local month_sec = 2592000
---@type number
local year_sec = 31536000

local tmp_today = os.date("*t", os.time())

-- Summarizing various elements of today's date
---@type table
local today = {
    year = tmp_today.year,
    month = tmp_today.month,
    day = tmp_today.day,
    -- zero padding
    z_month = string.format("%02d", tmp_today.month),
    -- zero padding
    z_day = string.format("%02d", tmp_today.day),
}

---@return string
utils.today = function()
    return (today.year .. "年" .. today.z_month .. "月" .. today.z_day .. "日")
end

---@return string
utils.tomorrow = function()
    local tmp = os.date("*t", os.time() + day_sec)
    local month = string.format("%02d", tmp.month)
    local day = string.format("%02d", tmp.day)
    return (tmp.year .. "年" .. month .. "月" .. day .. "日")
end

---@return string
utils.yesterday = function()
    local tmp = os.date("*t", os.time() - day_sec)
    local month = string.format("%02d", tmp.month)
    local day = string.format("%02d", tmp.day)
    return (tmp.year .. "年" .. month .. "月" .. day .. "日")
end

---@return string
utils.current_month = function()
    return (today.year .. "年" .. today.z_month .. "月")
end

---@return string
utils.next_month = function()
    local tmp = os.date("*t", os.time() + month_sec + day_sec)
    local month = string.format("%02d", tmp.month)
    return (tmp.year .. "年" .. month .. "月")
end

---@return string
utils.last_month = function()
    local tmp = os.date("*t", os.time() - month_sec)
    local month = string.format("%02d", tmp.month)
    return (tmp.year .. "年" .. month .. "月")
end

---@return string
utils.current_year = function()
    return (today.year .. "年")
end

---@return string
utils.next_year = function()
    local tmp = os.date("*t", os.time() + year_sec)
    return (tmp.year .. "年")
end

---@return string
utils.last_year = function()
    local tmp = os.date("*t", os.time() - year_sec)
    return (tmp.year .. "年")
end

return utils
