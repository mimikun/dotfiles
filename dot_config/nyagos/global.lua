local global = {}

local os_name = nyagos.goos
local hostname = nyagos.exec("hostname")

function global:load_variables()
    ---@type boolean
    local is_linux = os_name == "linux"
    self.is_linux = is_linux

    ---@type boolean
    local is_windows = os_name == "windows"
    self.is_windows = is_windows

    ---@type boolean
    local is_azusa = hostname == "azusa"
    self.is_azusa = is_azusa

    ---@type boolean
    local is_not_human_rights = hostname == "TanakaPC"
    self.is_not_human_rights = is_not_human_rights

    ---@type string
    local path_sep = self.is_windows and "\\" or "/"
    self.path_sep = path_sep

    local home = self.is_windows and nyagos.getenv("USERPROFILE") or nyagos.getenv("HOME")
    self.home = home

    ---@type string
    local nyagos_path = table.concat({ home, ".config", "nyagos" }, path_sep)
    self.nyagos_path = nyagos_path
end

global:load_variables()

return global
