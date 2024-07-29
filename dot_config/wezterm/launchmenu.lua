local wsl_domain = require("global").is_human_rights and "WSL:Ubuntu" or "WSL:Ubuntu-20.04"

local M = {}

M.wsl_domain = wsl_domain

M.launch_menu = {
    -- 1
    {
        label = "WSL Ubuntu",
        domain = {
            DomainName = wsl_domain,
        },
    },
    -- 2
    {
        label = "Windows PowerShell v7",
        domain = {
            DomainName = "local",
        },
        args = { "pwsh.exe" },
    },
    -- 3
    {
        label = "Windows PowerShell v5",
        domain = {
            DomainName = "local",
        },
        args = { "powershell.exe" },
    },
    -- 4
    {
        label = "Windows cmd.exe",
        domain = {
            DomainName = "local",
        },
        args = { "cmd.exe" },
    },
    -- 5
    {
        label = "nyagos - Nihongo Yet Another GOing Shell",
        domain = {
            DomainName = "local",
        },
        args = { "nyagos.exe" },
    },
    -- 6
    {
        label = "WSL NixOS",
        domain = {
            DomainName = "WSL:NixOS",
        },
    },
}

return M
