# copy powershell profile
function Copy-PowershellProfile()
{
    ###########################
    # Copy PowerShell profile #
    ###########################

    $profiles = @{
        base = Join-Path $env:USERPROFILE -ChildPath ".config\powershell\Microsoft.PowerShell_profile.ps1"
        pwsh = @{
            onedrive = Join-Path $env:USERPROFILE -ChildPath "OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
            document = Join-Path $env:USERPROFILE -ChildPath "Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
        }
        powershell = @{

            onedrive = Join-Path $env:USERPROFILE -ChildPath "OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
            document = Join-Path $env:USERPROFILE -ChildPath "Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
        }
    }

    Write-Output "Copy PowerShell profile"

    if ($env:COMPUTERNAME -eq "TANAKAPC")
    {
        Copy-Item -Path $profiles.base -Destination $profiles.pwsh.document
        Copy-Item -Path $profiles.base -Destination $profiles.powershell.document
    } elseif ($env:COMPUTERNAME -eq "Wakamo")
    {
        Copy-Item -Path $profiles.base -Destination $profiles.pwsh.document
        Copy-Item -Path $profiles.base -Destination $profiles.powershell.document
    } else
    {
        Copy-Item -Path $profiles.base -Destination $profiles.pwsh.onedrive
        Copy-Item -Path $profiles.base -Destination $profiles.powershell.onedrive
    }
}

# copy neovim config
function Copy-NeovimConfig()
{
    ####################################
    # Copy nvim (neovim) configuration #
    ####################################

    $nvim_configs = @{
        base = @{
            full = Join-Path -Path $env:CHEZMOI_DIR -ChildPath "dot_config\nvim\*"
            mini = Join-Path -Path $env:CHEZMOI_DIR -ChildPath "dot_config\nvim-mini\*"
        }
        windows = Join-Path -Path $env:LOCALAPPDATA -ChildPath "nvim\"
    }

    Write-Output "Remove old nvim(neovim) configuration"
    # folder exist check
    if (Test-Path -Path $nvim_configs.windows)
    {
        # Remove files and sub-directories(and hidden files) in the directory
        Get-ChildItem -Path $nvim_configs.windows -Force -Recurse | Remove-Item -Force -Recurse
        Write-Output "All files in env:LOCALAPPDATA/nvim directory have been removed"
    } else 
    {
        # Create the env:LOCALAPPDATA/nvim directory if it does not exist
        New-Item -Path $nvim_configs.windows -ItemType "directory" > $null
        Write-Output "Created env:LOCALAPPDATA/nvim directory"
    }

    Write-Output "Copy nvim (neovim) configuration"

    # copy
    if ($env:COMPUTERNAME -eq "TANAKAPC")
    {
        Copy-Item -Path $nvim_configs.base.mini -Destination $nvim_configs.windows -Recurse -Force
    } else
    {
        Copy-Item -Path $nvim_configs.base.full -Destination $nvim_configs.windows -Recurse -Force
    }
}

# copy paleovim config
function Copy-PaleovimConfig()
{
    #####################################
    # Copy vim (paleovim) configuration #
    #####################################

    # paleovim config
    $pvim_configs = @{
        base = @{
            home = Join-Path -Path $env:CHEZMOI_DIR -ChildPath "dot_config\vim\*"
            work = Join-Path -Path $env:CHEZMOI_DIR -ChildPath "dot_vim\*"
        }
        windows = Join-Path -Path $env:USERPROFILE -ChildPath "vimfiles\"
    }

    Write-Output "Remove old vim(paleovim) configuration"

    # folder exist check
    if (Test-Path -Path $pvim_configs.windows)
    {
        # Remove files and sub-directories(and hidden files) in the directory
        Get-ChildItem -Path $pvim_configs.windows -Force -Recurse | Remove-Item -Force -Recurse
        Write-Output "All files in vimfiles directory have been removed"
    } else
    {
        # Create the vimfiles directory if it does not exist
        New-Item -Path $pvim_configs.windows -ItemType "directory" > $null
        Write-Output "Created vimfiles directory"
    }

    Write-Output "Copy vim (paleovim) configuration"

    # copy
    if ($env:COMPUTERNAME -eq "TANAKAPC")
    {
        Copy-Item -Path $pvim_configs.base.work -Destination $pvim_configs.windows -Recurse -Force
    } else
    {
        Copy-Item -Path $pvim_configs.base.home -Destination $pvim_configs.windows -Recurse -Force
    }
}

# Run after chezmoi apply
function Invoke-RunAfterChezmoiApply()
{
    Write-Output "post-apply-hook"
    # env check
    if (-not $env:CHEZMOI_DIR)
    {
        try
        {
            $env:CHEZMOI_DIR = (chezmoi source-path)
        } catch
        {
            Write-Output "Failed to get chezmoi source path. Make sure chezmoi is installed and in your PATH."
            return
        }
    }

    # copy powershell profile
    Copy-PowershellProfile

    # copy neovim config
    Copy-NeovimConfig

    # copy paleovim config
    Copy-PaleovimConfig
}

Invoke-RunAfterChezmoiApply
