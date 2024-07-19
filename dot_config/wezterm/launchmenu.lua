local wsl_domain = require("global").is_human_rights and "WSL:Ubuntu" or "WSL:Ubuntu-20.04"

local M = {}

M.wsl_domain = wsl_domain

M.launch_menu = {
    {
        label = "WSL Ubuntu",
        domain = {
            DomainName = wsl_domain,
        },
    },
    {
        label = "WSL NixOS",
        domain = {
            DomainName = "WSL:NixOS",
        },
    },
    {
        label = "Windows PowerShell v5",
        domain = {
            DomainName = "local",
        },
        args = { "powershell.exe" },
    },
    {
        label = "Windows PowerShell v7",
        domain = {
            DomainName = "local",
        },
        args = { "pwsh.exe" },
    },
    {
        label = "Windows cmd.exe",
        domain = {
            DomainName = "local",
        },
        args = { "cmd.exe" },
    },
    {
        label = "nyagos - Nihongo Yet Another GOing Shell",
        domain = {
            DomainName = "local",
        },
        args = { "nyagos.exe" },
    },
}

return M
