local global = {}

local os_name = nyagos.goos
local hostname = nyagos.exec("hostname")

---@type boolean
local is_linux = os_name == "linux"

---@type boolean
local is_windows = os_name == "windows"

---@type boolean
local is_azusa = hostname == "azusa"

-- NOTE: nyagos cannot get sysinfo
---@type table
local human_rights_infos = {
    ["YutoWindows"] = true,
    ["Wakamo"] = true,
    ["azusa"] = true,
    ["Izuna"] = true,
    ["TanakaPC"] = false,
}

-- NOTE: nyagos cannot get sysinfo
---@type table
local personal_pcs = {
    ["YutoWindows"] = true,
    ["Wakamo"] = true,
    ["Izuna"] = true,
    ["azusa"] = true,
}

---@return boolean
local check_human_rights = function()
    return human_rights_infos[hostname] or false
end

---@return boolean
local check_work_pc = function()
    return not personal_pcs[hostname]
end

---@type boolean
local is_human_rights = check_human_rights()

---@type boolean
local is_work_pc = check_work_pc()

-- NOTE:
-- Windows: "\"
-- Linux: "/"
---@type string
local path_sep_char = string.sub(package.config, 1, 1)

-- NOTE: self.path_sep = self.is_windows and "\\" or "/"
---@type string
local path_sep = is_windows and string.rep(path_sep_char, 2) or path_sep_char

---@type string
local home = is_windows and nyagos.getenv("USERPROFILE") or nyagos.getenv("HOME")

---@type string
local nyagos_path = table.concat({ home, ".config", "nyagos" }, path_sep)

global.is_linux = is_linux
global.is_windows = is_windows
global.is_azusa = is_azusa
global.path_sep = path_sep
global.home = home
global.nyagos_path = nyagos_path
global.is_human_rights = is_human_rights
global.is_work_pc = is_work_pc

global.check_human_rights = check_human_rights
global.check_work_pc = check_work_pc

return global
