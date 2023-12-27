local utils = {}

utils.today = function()
    local date = os.date("*t")
    local year = date.year
    local month = date.month
    local day = date.day

    if month < 10 then
        month = "0" .. month
    end

    if day < 10 then
        day = "0" .. day
    end

    local formatted_date = tostring(year) .. tostring(month) .. tostring(day)
    return formatted_date
end

return utils
