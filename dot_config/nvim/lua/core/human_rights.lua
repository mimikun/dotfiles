local global = require("core.global")

local total_memory = vim.loop.get_total_memory()
local cpu_info = vim.loop.cpu_info()
local cpu_name = cpu_info[1].model
-- AMD Ryzen 9 3900X 12-Core Processor
local CPU_WITH_HUMAN_RIGHTS = { "Ryzen 9 3900X" }
-- 24
local PARALLELISM_WITH_HUMAN_RIGHTS = 20
local available_parallelism  = vim.loop.available_parallelism()
-- TODO:Harddisk human rights
-- local device_info = vim.fn.system("lsblk")

local is_windows = global.is_windows

-- 4GB
local linux_human_rights_memory_size = 4294967296
-- 9GB
local windows_human_rights_memory_size = 9663676416

local human_rights = {}

-- RAM
if is_windows then
    human_rights["memory"] = (total_memory > windows_human_rights_memory_size)
else
    human_rights["memory"] = (total_memory > linux_human_rights_memory_size)
end

-- CPU
print(available_parallelism)
print(cpu_name)
