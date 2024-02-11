local global = require("core.global")
local uv = vim.uv and vim.uv or vim.loop

local is_windows = global.is_windows
local is_mac = global.is_mac

-- basic human rights
local HUMAN_RIGHTS = {
    cpu = {
        "Ryzen 9 3900X",
        "i5-13500H",
    },
    memory = {
        -- 4GB
        linux = 4294967296,
        -- 9GB
        windows = 9663676416,
    },
    available_parallelism = 14,
    media_type = "SSD",
}

-- table.find()
---@param t table
---@param value any
---@return boolean
local find = function(t, value)
    for _, v in pairs(t) do
        if v == value then
            return true
        end
    end
    return false
end

---------
-- RAM --
---------
local total_memory = uv.get_total_memory()

---------
-- CPU --
---------
local cpu_info = uv.cpu_info()
local cpu_name = cpu_info[1].model
local cpu = find(HUMAN_RIGHTS.cpu, cpu_name)

----------
-- Disk --
----------
local media_type
if is_windows then
    -- Windows
    -- NOTE: VERY SLOW
    local raw_cmd = "(Get-PhysicalDisk | Select-Object MediaType).MediaType"
    local pwsh_cmd = 'pwsh.exe -Command "' .. raw_cmd .. '"'

    local tmp = vim.fn.system(pwsh_cmd)
    tmp = string.gsub(tmp, "%s+", "")
    media_type = tmp == HUMAN_RIGHTS.media_type
elseif is_mac then
    -- Mac
    media_type = true
else
    -- Linux
    local tmp = vim.fn.systemlist("lsblk -o ROTA | sed -e 's/\\s//g'")
    media_type = find(tmp, 0)
end

-----------------
-- Parallelism --
-----------------
local available_parallelism = uv.available_parallelism()

local human_rights = {}

if is_mac then
    -- Mac is a human right
    human_rights["memory"] = true
    human_rights["cpu"] = true
    human_rights["disk"] = true
    human_rights["available_parallelism"] = true
elseif is_windows then
    -- Windows
    -- Total memory > 9GB
    human_rights["memory"] = (total_memory > HUMAN_RIGHTS.memory.windows)
    human_rights["cpu"] = cpu
    human_rights["disk"] = media_type
    human_rights["available_parallelism"] = (available_parallelism > HUMAN_RIGHTS.available_parallelism)
else
    -- Linux
    -- Total memory > 4GB
    human_rights["memory"] = (total_memory > HUMAN_RIGHTS.memory.linux)
    human_rights["cpu"] = cpu
    human_rights["disk"] = media_type
    human_rights["available_parallelism"] = (available_parallelism > HUMAN_RIGHTS.available_parallelism)
end

print(human_rights["memory"])
print(human_rights["cpu"])
print(human_rights["disk"])
print(human_rights["available_parallelism"])

--[[
某PC: 非人権
6
Intel(R) Core(TM) i5-9400F CPU @ 2.90GHz
HDD

ゲーミングPC: 人権
24
AMD Ryzen 9 3900X 12-Core Processor
SSD

Mac: 人権しか存在しない

ThinkPad E14 Gen5 Intel: 人権未確認
16
13th Gen Intel(R) Core(TM) i5-13500H
SSD
]]
