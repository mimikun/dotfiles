local g = require("config.global")

---@type boolean
local is_work = not g.is_home

---@type table
local wsl = {
    ubuntu = {
        label = "WSL Ubuntu",
        domain = {
            DomainName = "WSL:Ubuntu",
        },
    },
    arch = {
        label = "WSL ArchLinux",
        domain = {
            DomainName = "WSL:ArchLinux",
        },
    },
    nixos = {
        label = "WSL NixOS",
        domain = {
            DomainName = "WSL:NixOS",
        },
    },
}

---@type table
local windows = {
    pwsh = {
        base = {
            label = "Windows PowerShell v7",
            domain = {
                DomainName = "local",
            },
            args = { "pwsh.exe" },
        },
        norc = {
            label = "Windows PowerShell v7 --norc",
            domain = {
                DomainName = "local",
            },
            args = { "pwsh.exe", "-NoProfile" },
        },
    },
    powershell = {
        base = {
            label = "Windows PowerShell v5",
            domain = {
                DomainName = "local",
            },
            args = { "powershell.exe" },
        },
        norc = {
            label = "Windows PowerShell v5 --norc",
            domain = {
                DomainName = "local",
            },
            args = { "powershell.exe", "-NoProfile" },
        },
    },
    cmd_exe = {
        label = "Windows cmd.exe",
        domain = {
            DomainName = "local",
        },
        args = { "cmd.exe" },
    },
    nyagos = {
        label = "nyagos - Nihongo Yet Another GOing Shell",
        domain = {
            DomainName = "local",
        },
        args = { "nyagos.exe" },
    },
}

---@type table
local launch_menu = {}
if is_work then
    table.insert(launch_menu, wsl.arch)
else
    table.insert(launch_menu, wsl.ubuntu)
end
table.insert(launch_menu, windows.pwsh.norc)
table.insert(launch_menu, wsl.nixos)
table.insert(launch_menu, windows.pwsh.base)
table.insert(launch_menu, windows.powershell.base)
table.insert(launch_menu, windows.powershell.norc)
table.insert(launch_menu, windows.cmd_exe)
table.insert(launch_menu, windows.nyagos)

local function menu(config)
    config.launch_menu = launch_menu
end

return menu
