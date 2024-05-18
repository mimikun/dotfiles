local global = require("global")
local home = global.home
local is_linux = global.is_linux
local is_azusa = global.is_azusa
local path_sep = global.path_sep

-- alias
if is_linux then
    nyagos.alias.f = "fuck"
    nyagos.alias.rm = "gomi"
    nyagos.alias.rm = "rm -i"
    nyagos.alias.mkdir = "mkdir -p"
    nyagos.alias.untar = "tar xvf"
    nyagos.alias.pueued_enable = "systemctl --user enable pueue"
    nyagos.alias.pueued_start = "systemctl --user start pueue"
    nyagos.alias.pueued_restart = "systemctl --user restart pueue"
    nyagos.alias.patch = "patch -p1 <"
    nyagos.alias.imgcat = "wezterm imgcat"
    nyagos.alias.pip = "python3 -m pip"
    nyagos.alias.pipx = "python3 -m pipx"
    nyagos.alias.zel = "zellij"
    nyagos.alias.pueuexec = "pueue add --"
    if not is_azusa then
        nyagos.alias.open = "wsl-open"
    end

    -- mise
    -- TODO: Run mise_activate_nyagos
    local mise_dir = table.concat({ home, ".local", "share", "mise" }, path_sep)
    local mise_shims = table.concat({ mise_dir, "shims" }, path_sep)
    -- Add mise shims to path
    nyagos.envadd("PATH", mise_shims)

    -- paleovim alias
    local paleovim = table.concat({ mise_shims, "vim" }, path_sep)
    nyagos.alias.paleovim = paleovim
    nyagos.alias.pvim = paleovim
    -- neovim alias
    nyagos.alias.vim = "nvim"
end

-- alias eza
nyagos.alias.ls = "eza"
nyagos.alias.ll = "ls -l"
nyagos.alias.la = "ls -la"
nyagos.alias.l1 = "ls -1"
nyagos.alias.lt = "ls --tree"
nyagos.alias.lat = "ls -l -a --tree"
nyagos.alias.lta = "ls --tree -a"
