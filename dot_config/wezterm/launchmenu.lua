local wsl_domain = "WSL:Ubuntu"

local wsl = {
    ubuntu = {
        label = "WSL Ubuntu",
        domain = {
            DomainName = wsl_domain,
        },
    },
    nixos = {
        label = "WSL NixOS",
        domain = {
            DomainName = "WSL:NixOS",
        },
    },
}

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

local M = {}

M.wsl_domain = wsl_domain

M.launch_menu = {
    -- 1
    wsl.ubuntu,
    -- 2
    windows.pwsh.base,
    -- 3
    windows.pwsh.norc,
    -- 4
    windows.powershell.base,
    -- 5
    windows.powershell.norc,
    -- 6
    windows.cmd_exe,
    -- 7
    windows.nyagos,
    -- 8
    wsl.nixos,
}

return M
